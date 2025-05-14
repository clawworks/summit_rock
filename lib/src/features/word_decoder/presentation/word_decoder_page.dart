import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/src/features/results/application/result_service.dart';
import 'package:summit_rock/src/features/settings/domain/summit_rock_year.dart';
import 'package:summit_rock/src/features/word_decoder/presentation/number_selector.dart';
import 'package:summit_rock/src/features/word_decoder/presentation/word_decoder_controller.dart';
import 'package:summit_rock/src/routing/app_router.dart';

import '../domain/result.dart';

class WordDecoderPage extends HookConsumerWidget {
  const WordDecoderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(wordDecoderControllerProvider, (_, state) {
      // state.showAlertDialogOnError(context);
      if (state.hasError) {
        print(
            "Error in WordDecoderController!\nError: ${state.error}\nStack: ${state.stackTrace}");
        context.goNamed(AppRoute.oops);
      }
    });

    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title:
            Text('Summit Rock ${ref.watch(yearSelectionProvider).toString()}'),
        // foregroundColor: Theme.of(context).colorScheme.primary,
        // foregroundColor: Theme.of(context).colorScheme.onPrimary,
        // backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: () async {
              context.goNamed(AppRoute.settings);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: ListView(
        children: [
          const NumberSelector(),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0, bottom: 8.0),
              child: Text(
                'History',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          const ResultsList(),
        ],
      ),
    );
  }
}

class ResultsList extends ConsumerWidget {
  const ResultsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(resultsListStreamProvider);
    return asyncValue.when(
      data: (results) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              for (Result result in results) ResultCard(result: result),
            ],
          ),
        );
      },
      error: (err, stack) {
        print("ERROR loading results: $err\n$stack");
        return const Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Icon(
                  Icons.error_outline,
                  size: 60.0,
                ),
                Text(
                  'Error loading results...\n\nYou may need to delete your data in order to proceed.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
      loading: () {
        return const CircularProgressIndicator.adaptive();
      },
    );
  }
}

class ResultCard extends ConsumerWidget {
  const ResultCard({required this.result, super.key});

  final Result result;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: InkWell(
        radius: 10.0,
        onTap: () async {
          context.goNamed(AppRoute.result,
              pathParameters: {'resultId': result.id});
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ref.watch(resultTitleProvider(result)),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(width: 20.0),
              Flexible(
                child: Wrap(
                  children: [
                    for (String fav in result.favorites)
                      Text('$fav${fav == result.favorites.last ? '' : ', '}'),
                  ],
                ),
              ),
              // Text('${result.favorites}'),
            ],
          ),
        ),
      ),
    );
  }
}
