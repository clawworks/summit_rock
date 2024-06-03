import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/src/common_widgets/text_widgets.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';
import 'package:summit_rock/src/features/word_decoder/presentation/result_page_controller.dart';

class WordList extends ConsumerStatefulWidget {
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
  ConsumerState<WordList> createState() => _WordListState();
}

class _WordListState extends ConsumerState<WordList> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    if (widget.title == 'Favorites') {
      expanded = true;
    }
    return Column(
      children: [
        InkWell(
          onTap: () async {
            setState(() => expanded = !expanded);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeadlineSmall(widget.title),
                Icon(expanded
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_right),
              ],
            ),
          ),
        ),
        if (expanded)
          // TODO make this expandable...
          GridView.count(
            crossAxisCount: 4,
            primary: false,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 2.0,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              for (String word in widget.list)
                WordItem(resultId: widget.resultId, word: word),
            ],
          ),
        const Divider(),
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
