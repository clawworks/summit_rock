import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/src/features/results/application/result_service.dart';
import 'package:summit_rock/src/features/results/presentation/clue_number_incrementer.dart';
import 'package:summit_rock/src/features/results/presentation/summit_rock_picker.dart';
import 'package:summit_rock/src/features/results/presentation/summit_year_picker.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';

class ResultMetadataBody extends ConsumerWidget {
  const ResultMetadataBody({required this.resultId, super.key});

  final String resultId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Result?> asyncValue = ref.watch(resultStreamProvider(resultId));
    return asyncValue.when(
      data: (result) {
        if (result == null) return SizedBox.shrink();
        return Column(
          children: [
            SummitYearPicker(result: result),
            SummitRockPicker(result: result),
            ClueNumberIncrementer(result: result),
            const SizedBox(height: 40),
          ],
        );
      },
      error: (err, stack) => SizedBox.shrink(),
      loading: () => Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
