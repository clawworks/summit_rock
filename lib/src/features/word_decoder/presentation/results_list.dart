import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/src/features/word_decoder/domain/combination.dart';

class ResultsList extends ConsumerWidget {
  const ResultsList({required this.title, required this.list, super.key});

  final String title;
  final List<Combination> list;

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
        for (Combination combo in list)
          GestureDetector(
            onTap: () async {
              // ref.read(outsideCombosProvider.notifier).toggleFavorite(combo);
              // combo.favorite = !combo.favorite;
            },
            child: Container(
              // color: Colors.green,
              child: Center(
                child: Text(
                  '${combo.word}, ',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: combo.favorite
                            ? Theme.of(context).colorScheme.primary
                            : null,
                        fontWeight: combo.favorite ? FontWeight.bold : null,
                      ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
