import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/src/features/results/application/result_service.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';
import 'package:summit_rock/src/utilities/enums/rock_number.dart';

class SummitRockPicker extends ConsumerWidget {
  const SummitRockPicker({required this.result, super.key});

  final Result result;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // bool selected = ref.watch();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Summit Rock ',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          Wrap(
            spacing: 10.0,
            // runSpacing: 4.0,
            children: [
              for (final rock in RockNumber.values)
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: rock == result.rockNumber
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.primaryFixedDim,
                    side: BorderSide(
                      color: rock == result.rockNumber
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.primaryFixedDim,
                    ),
                    // textStyle: TextStyle(
                    //   fontWeight: FontWeight.bold,
                    // ),
                    // textStyle: rock == result.rockNumber
                    //     ? Theme.of(context).textTheme.titleSmall
                    //     : Theme.of(context).textTheme.titleMedium,
                  ),
                  onPressed: () async {
                    Result copy = result.copyWith(rockNumber: rock);
                    await ref.read(resultServiceProvider).setResult(copy);
                  },
                  child: Text(rock.toString()),
                )
            ],
          ),
        ],
      ),
    );
  }
}
