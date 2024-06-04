import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';

class CopyButton extends StatelessWidget {
  const CopyButton({required this.result, super.key});

  final Result result;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        String listString = 'Words for ${result.combined}\n\n';
        listString += 'Favorites:\n\n${result.favorites}\n\n\n';
        result.decodedWords.forEach((key, value) {
          listString += '$key:\n\n$value\n\n\n';
        });
        Clipboard.setData(ClipboardData(text: listString));
      },
      child: const Text("Copy All"),
    );
  }
}
