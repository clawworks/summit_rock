import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/src/features/results/application/result_service.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';

class ClueNumberIncrementer extends ConsumerWidget {
  const ClueNumberIncrementer({required this.result, super.key});

  final Result result;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Clue #',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Row(
            children: [
              OutlinedButton(
                onPressed: (result.clueNumber ?? 0) > 0
                    ? () async {
                        int? clueNumber = (result.clueNumber ?? 0) - 1;
                        if (clueNumber < 1) {
                          clueNumber = null;
                        }
                        Result copy = result.copyWith(clueNumber: clueNumber);
                        await ref.read(resultServiceProvider).setResult(copy);
                      }
                    : null,
                child: Icon(Icons.remove),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "${result.clueNumber ?? 0}",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              OutlinedButton(
                onPressed: () async {
                  final clueNumber = (result.clueNumber ?? 0) + 1;
                  Result copy = result.copyWith(clueNumber: clueNumber);
                  await ref.read(resultServiceProvider).setResult(copy);
                },
                child: Icon(Icons.add),
              ),
              // IconButton(
              //   onPressed: () {},
              //   icon: Icon(Icons.remove),
              // ),
              // Text(
              //   '2',
              //   style: Theme.of(context).textTheme.headlineSmall,
              // ),
              // IconButton(
              //   onPressed: () {},
              //   icon: Icon(Icons.add),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
