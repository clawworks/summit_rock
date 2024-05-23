import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/src/common_widgets/oops_page.dart';
import 'package:summit_rock/src/features/word_decoder/application/result_service.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';

class ResultPage extends ConsumerWidget {
  const ResultPage({required this.resultId, super.key});

  final ResultId resultId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Result?> asyncValue = ref.watch(resultStreamProvider(resultId));
    return asyncValue.when(
      data: (result) {
        return Scaffold(
          appBar: AppBar(
            title: Text('${result?.numbers}'),
          ),
          body: const Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('No settings yet...'),
                )
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
        return const CircularProgressIndicator.adaptive();
      },
    );
  }
}
