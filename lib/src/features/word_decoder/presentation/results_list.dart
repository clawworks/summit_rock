import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';
import 'package:summit_rock/src/features/word_decoder/presentation/result_page_controller.dart';

class WordList extends ConsumerWidget {
  const WordList({
    required this.resultId,
    required this.title,
    required this.list,
    super.key,
  });

  final ResultId resultId;
  final String title;
  final List<String> list;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.count(
      crossAxisCount: 4,
      primary: false,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: 2.0,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        for (String word in list) WordItem(resultId: resultId, word: word),
      ],
    );
  }
}

class WordItem extends ConsumerWidget {
  const WordItem({required this.resultId, required this.word, super.key});

  final ResultId resultId;
  final String word;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isFavorite = ref
        .watch(resultPageControllerProvider(resultId).notifier)
        .isFavorite(word);
    return GestureDetector(
      onTap: () async {
        ref
            .read(resultPageControllerProvider(resultId).notifier)
            .toggleFavorite(word);
        // word.favorite = !word.favorite;
      },
      child: Container(
        // color: Colors.green,
        child: Center(
          child: Text(
            '$word, ',
            // TODO style this, bold if favorite
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color:
                      isFavorite ? Theme.of(context).colorScheme.primary : null,
                  fontWeight: isFavorite ? FontWeight.bold : null,
                ),
          ),
        ),
      ),
    );
  }
}
