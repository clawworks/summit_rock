import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/src/common_widgets/oops_page.dart';
import 'package:summit_rock/src/features/word_decoder/application/result_service.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';
import 'package:summit_rock/src/features/word_decoder/presentation/copy_button.dart';
import 'package:summit_rock/src/features/word_decoder/presentation/results_list.dart';

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
        return Scaffold(
          appBar: AppBar(
            title: Text(result.combined),
          ),
          body: Center(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // const HeadlineSmall('Favorites:'),
                      WordList(
                          resultId: resultId,
                          title: 'Favorites',
                          list: result.favorites),
                      // TODO reorder lists
                      for (var entry in lists)
                        Column(
                          children: [
                            // HeadlineSmall(entry.key.toString()),
                            WordList(
                                resultId: resultId,
                                title: entry.key.toString(),
                                list: entry.value),
                          ],
                        ),

                      CopyButton(result: result),
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
