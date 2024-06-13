import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';
import 'package:summit_rock/src/features/word_decoder/presentation/word_decoder_controller.dart';
import 'package:summit_rock/src/routing/app_router.dart';

class NumberSelector extends HookConsumerWidget {
  const NumberSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numController = useTextEditingController(text: '');
    final numbers = useState<List<int>>([]);
    final letterMap = useState<Map<int, String>>({});
    return Column(
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
                  // textInputAction: TextInputAction.go,
                  onSubmitted: (value) {
                    print("Go button tapped!");
                  },
                  keyboardType: TextInputType.datetime,
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
                      numbers.value = [...numbers.value, number];
                    } else {
                      int index = numbers.value.length + letterMap.value.length;
                      letterMap.value[index] = numController.text.toUpperCase();
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(
                      //     content: Text('Must enter a number'),
                      //   ),
                      // );
                    }
                    numController.clear();
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
              for (int i = 0; i < numbers.value.length; i++)
                Text(
                  numbers.value[i].toString(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
            ],
          ),
        ),
        Visibility(
          visible: numbers.value.length > 1,
          child: ElevatedButton(
            onPressed: () async {
              if (numController.text.isNotEmpty) {
                int? number = int.tryParse(numController.text);
                if (number != null) {
                  numbers.value = [...numbers.value, number];
                  numController.clear();
                }
              }
              FocusManager.instance.primaryFocus?.unfocus();
              Result result = await ref
                  .read(wordDecoderControllerProvider.notifier)
                  .getResults(
                    numbers: numbers.value,
                    letterMap: letterMap.value,
                  );
              if (context.mounted) {
                context.goNamed(
                  AppRoute.result,
                  pathParameters: {'resultId': result.id},
                );
              }
              numbers.value = [];
            },
            child: const Text('Check Numbers!'),
          ),
        ),
      ],
    );
  }
}
