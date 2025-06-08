import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/src/common_widgets/oops_page.dart';
import 'package:summit_rock/src/common_widgets/text_widgets.dart';
import 'package:summit_rock/src/features/results/application/result_service.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';
import 'package:summit_rock/src/features/word_decoder/presentation/copy_button.dart';
import 'package:summit_rock/src/features/word_decoder/presentation/results_list.dart';
import 'package:summit_rock/src/features/word_decoder/presentation/results_list_controller.dart';
import 'package:summit_rock/src/routing/app_router.dart';

class ResultPage extends ConsumerWidget {
  const ResultPage({required this.resultId, super.key});

  final ResultId resultId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Result?> asyncValue = ref.watch(resultStreamProvider(resultId));
    print("****************** Redrawing ResultPage build *******************");
    return asyncValue.when(
      data: (result) {
        print("Got data Result: $result ");
        if (result == null) {
          return const OopsPage(
            message: 'We cannot find that result... Please try again.',
          );
        }

        final lists = result.decodedWords.entries.toList().reversed;
        final title = ref.watch(resultTitleProvider(result));
        return Scaffold(
          appBar: AppBar(
            title: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(title),
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  context.goNamed(AppRoute.resultSearch,
                      pathParameters: {'resultId': resultId});
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          body: Center(
            child: ListView(
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              result.year.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                      // color: Theme.of(context).colorScheme.primary,
                                      ),
                            ),
                            Text(
                              result.rockNumber?.toString() ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      // color: Theme.of(context).colorScheme.primary,
                                      ),
                            ),
                          ],
                        ),
                        Text(
                          result.clueNumber != null
                              ? 'Clue #${result.clueNumber}'
                              : '',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // const HeadlineSmall('Favorites:'),
                      WordList(
                        resultId: resultId,
                        title: 'Favorites',
                        list: result.favorites,
                        containsFavorite: false,
                      ),
                      // TODO reorder lists
                      for (var entry in lists)
                        Column(
                          children: [
                            // HeadlineSmall(entry.key.toString()),
                            WordList(
                              resultId: resultId,
                              title: entry.key.toString(),
                              list: entry.value,
                              containsFavorite: ref.watch(
                                listContainsFavoriteProvider(
                                    entry.value, result.favorites),
                              ),
                            ),
                          ],
                        ),

                      CopyButton(result: result),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TitleLarge('${result.year} T-Shirt'),
                      ),
                      // const HeadlineSmall('Outside Ring Words:'),
                      // WordList(
                      //     resultId: resultId,
                      //     title: 'Outside Ring Words',
                      //     list: result.outsideWords),
                      // const HeadlineSmall('Middle Ring Words:'),
                      // WordList(
                      //     resultId: resultId,
                      //     title: 'Middle Ring Words',
                      //     list: result.middleWords),
                      // const HeadlineSmall('Inside Ring Words:'),
                      // WordList(
                      //     resultId: resultId,
                      //     title: 'Inside Ring Words',
                      //     list: result.insideWords),

                      // const HeadlineSmall('Tick Ring Words:'),
                      // WordList(resultId: resultId, title: 'Favorites', list: result.favorites),
                      // const HeadlineSmall('Inside Dot Ring Words:'),
                      // WordList(resultId: resultId, title: 'Favorites', list: result.favorites),
                      // const HeadlineSmall('Outside Dot Ring Words:'),
                      // WordList(resultId: resultId, title: 'Favorites', list: result.favorites),
                      // const HeadlineSmall('Inside Dot Ring With Arrows Words:'),
                      // WordList(resultId: resultId, title: 'Favorites', list: result.favorites),
                      // const HeadlineSmall(
                      //     'Outside Dot Ring With Arrows Words:'),
                      // WordList(resultId: resultId, title: 'Favorites', list: result.favorites),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (err, stack) {
        print("ERROR getting Result: $err\n$stack");
        return const OopsPage(
          message: 'We cannot find that result... Please try again.',
        );
      },
      loading: () {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }
}
