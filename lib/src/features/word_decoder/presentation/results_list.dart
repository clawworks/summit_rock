import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ResultsList extends ConsumerWidget {
  const ResultsList({required this.title, required this.list, super.key});

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
        for (String word in list)
          GestureDetector(
            onTap: () async {
              // ref.read(outsideCombosProvider.notifier).toggleFavorite(word);
              // word.favorite = !word.favorite;
            },
            child: Container(
              // color: Colors.green,
              child: Center(
                child: Text(
                  '$word, ',
                  // TODO style this, bold if favorite
                  // style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  //       color: word.favorite
                  //           ? Theme.of(context).colorScheme.primary
                  //           : null,
                  //       fontWeight: word.favorite ? FontWeight.bold : null,
                  //     ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
