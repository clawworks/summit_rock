import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/src/features/results/application/result_service.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';
import 'package:summit_rock/src/features/word_decoder/presentation/word_decoder_controller.dart';
import 'package:summit_rock/src/routing/app_router.dart';

class NumberSelector extends HookConsumerWidget {
  const NumberSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numController = useTextEditingController(text: '');
    final focusNode = useFocusNode();
    final numbers = useState<List<int>>([]);
    final letterMap = useState<Map<int, String>>({});
    final combined = ref.watch(combinedListProvider(
        numbers: numbers.value, letterMap: letterMap.value));

    Future<void> addNumber() async {
      if (numController.text.isEmpty) return;
      int? number = int.tryParse(numController.text);
      if (number != null) {
        numbers.value = [...numbers.value, number];
      } else {
        int index = numbers.value.length + letterMap.value.length;
        letterMap.value = {
          ...letterMap.value,
          ...{index: numController.text.toUpperCase()}
        };
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text('Must enter a number'),
        //   ),
        // );
      }
      numController.clear();
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            "Enter the #'s from the clue, one at a time",
            textAlign: TextAlign.center,
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
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    // fillColor: Colors.white,
                    // focusColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 3.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  // onTapOutside: (_) =>
                  //     FocusManager.instance.primaryFocus?.unfocus(),
                  controller: numController,
                  // textInputAction: TextInputAction.go,
                  onSubmitted: (value) async {
                    focusNode.requestFocus();
                    await addNumber();
                  },
                  keyboardType: TextInputType.datetime,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                  textInputAction: TextInputAction.go,
                ),
              ),
              Flexible(
                flex: 2,
                child: TextButton(
                  onPressed: () => addNumber(),
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
            children: List.generate(
              combined.length,
              (index) {
                return Text(
                  combined[index],
                  style: Theme.of(context).textTheme.titleLarge,
                );
              },
            ),
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
