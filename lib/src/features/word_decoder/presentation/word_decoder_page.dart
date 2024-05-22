import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/src/features/word_decoder/domain/combination.dart';
import 'package:summit_rock/src/features/word_decoder/presentation/word_decoder_controller.dart';
import 'package:summit_rock/src/routing/app_router.dart';

class WordDecoderPage extends HookConsumerWidget {
  const WordDecoderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(wordDecoderControllerProvider, (_, state) {
      // state.showAlertDialogOnError(context);
      if (state.hasError) {
        print("Error in WordDecoderController!\nError: ${state.error}");
        context.goNamed(AppRoute.oops);
      }
    });

    final numController = useTextEditingController(text: '');
    final numbers = ref.watch(numberListProvider);
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: const Text('Summit Rock 2024'),
        // foregroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
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
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "Enter the numbers in from the clue...",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      // fillColor: Colors.white,
                      // focusColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    // onTapOutside: (_) =>
                    //     FocusManager.instance.primaryFocus?.unfocus(),
                    controller: numController,
                    textInputAction: TextInputAction.go,
                    onSubmitted: (value) {
                      print("Go button tapped!");
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Flexible(
                  child: TextButton(
                    onPressed: () async {
                      int? number = int.tryParse(numController.text);
                      print("Number: $number");
                      if (number != null) {
                        ref
                            .watch(numberListProvider.notifier)
                            .addNumber(number);
                        numController.clear();
                      } else {
                        // TODO show snack bar
                      }
                    },
                    style: TextButton.styleFrom(
                      // foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                    ),
                    child: const Text('Add'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < numbers.length; i++)
                  Text(
                    numbers[i].toString(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
              ],
            ),
          ),
          Visibility(
            visible: numbers.length > 1,
            child: ElevatedButton(
              onPressed: () async {
                if (numController.text.isNotEmpty) {
                  int? number = int.tryParse(numController.text);
                  if (number != null) {
                    ref.watch(numberListProvider.notifier).addNumber(number);
                    numController.clear();
                  }
                }
                FocusManager.instance.primaryFocus?.unfocus();
                await ref
                    .read(wordDecoderControllerProvider.notifier)
                    .getResults();
              },
              child: const Text('Check Numbers!'),
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
    final outsideCombos = ref.watch(outsideCombosProvider);
    final middleCombos = ref.watch(middleCombosProvider);
    // final insideCombos = ref.watch(middleCombosProvider);
    return GridView.count(
      crossAxisCount: 4,
      primary: false,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: 2.0,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        for (Combination combo in outsideCombos)
          GestureDetector(
            onTap: () async {
              ref.read(outsideCombosProvider.notifier).toggleFavorite(combo);
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
    // return Wrap(
    //   children: [
    //     const Text('Outside Words:'),
    //     for (Combination combo in outsideCombos)
    //       GestureDetector(
    //         onTap: () async {
    //           combo.favorite = !combo.favorite;
    //         },
    //         child: Text(
    //           '${combo.word}, ',
    //           style: Theme.of(context).textTheme.bodyLarge?.copyWith(
    //                 color: combo.favorite
    //                     ? Theme.of(context).colorScheme.primary
    //                     : null,
    //                 fontWeight: combo.favorite ? FontWeight.bold : null,
    //               ),
    //         ),
    //       ),
    //     const Text('Middle Words:'),
    //     for (Combination combo in middleCombos)
    //       Text(
    //         '${combo.word}, ',
    //         style: Theme.of(context).textTheme.bodyLarge?.copyWith(
    //               color: combo.favorite
    //                   ? Theme.of(context).colorScheme.primary
    //                   : null,
    //               fontWeight: combo.favorite ? FontWeight.bold : null,
    //             ),
    //       ),
    //     // const Text('Inside Words:'),
    //     // for (Combination combo in insideCombos) Text(combo.word),
    //   ],
    // );
  }
}
