import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/src/common_widgets/oops_page.dart';
import 'package:summit_rock/src/features/results/application/result_service.dart';
import 'package:summit_rock/src/features/search/presentation/result_search_page_controller.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';
import 'package:summit_rock/src/features/word_decoder/presentation/results_list.dart';

class ResultSearchPage extends HookConsumerWidget {
  const ResultSearchPage({required this.resultId, super.key});
  final ResultId resultId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    AsyncValue<Result?> asyncValue = ref.watch(resultStreamProvider(resultId));
    print(
        "****************** Redrawing ResultSearchPage build *******************");
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
            title: const Text('Search'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: searchController,
                  autofocus: true,
                  decoration: InputDecoration(
                    // fillColor: Colors.white,
                    // focusColor: Colors.white,
                    // filled: true,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 3.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  onChanged: (value) {
                    ref.read(searchPatternProvider.notifier).setPattern(value);
                  },
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (var entry in lists)
                        _ListResults(
                          resultId: resultId,
                          listName: '${entry.key}',
                          words: entry.value,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (err, stack) {
        return const OopsPage(
            message: 'We cannot find that result... Please try again.');
      },
      loading: () {
        return const CircularProgressIndicator.adaptive();
      },
    );
  }
}

class _ListResults extends ConsumerWidget {
  const _ListResults({
    required this.resultId,
    required this.listName,
    required this.words,
    super.key,
  });
  final ResultId resultId;
  final String listName;
  final List<String> words;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String pattern = ref.watch(searchPatternProvider);
    List<String> matches = words
        .where((word) => word.toLowerCase().contains(pattern.toLowerCase()))
        .toList();
    return Column(
      children: [
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(listName),
            Text('${pattern.isNotEmpty ? matches.length : 0} matches'),
          ],
        ),
        if (pattern.isNotEmpty)
          GridView.count(
            crossAxisCount: ref.watch(
                getCrossAxisCountProvider(length: matches.firstOrNull?.length)),
            primary: false,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 2.0,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              for (String word in matches)
                WordItem(resultId: resultId, word: word),
            ],
          ),
        // Wrap(
        //   spacing: 16.0,
        //   runSpacing: 8.0,
        //   children: [
        //     for (final match in matches)
        //       WordItem(resultId: resultId, word: match),
        //   ],
        // ),
      ],
    );
  }
}
