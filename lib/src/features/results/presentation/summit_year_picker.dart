import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/src/features/results/application/result_service.dart';
import 'package:summit_rock/src/features/settings/domain/summit_rock_year.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';

class SummitYearPicker extends ConsumerWidget {
  const SummitYearPicker({required this.result, super.key});

  final Result result;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async {
        final year = SummitRockYear.values.firstWhere((y) => y != result.year);
        Result copy = result.copyWith(year: year);
        await ref.read(resultServiceProvider).setResult(copy);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Summit Rock Year',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              result.year.toString(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
