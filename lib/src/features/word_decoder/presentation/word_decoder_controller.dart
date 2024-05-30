import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:summit_rock/src/features/word_decoder/application/result_service.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';
import 'package:summit_rock/src/utilities/list_english_words.dart';

part 'word_decoder_controller.g.dart';
//
// @riverpod
// List<String> outsideWords(OutsideWordsRef ref) {
//   return [];
// }
//
// @riverpod
// List<String> middleWords(MiddleWordsRef ref) {
//   return [];
// }

@Riverpod(keepAlive: true)
class WordDecoderController extends _$WordDecoderController {
  @override
  FutureOr<void> build() {
    // Nothing to do
  }

  String _makeId(List<int> numbers) {
    String id = '';
    for (int i = 0; i < numbers.length; i++) {
      int num = numbers[i];
      id += i == 0 ? '$num' : '_$num';
    }
    return id;
  }

  Future<Result> getResults({required List<int> numbers}) async {
    List<String> outsideWords = _checkNumbers(numbers, _outsideRing);
    List<String> middleWords = _checkNumbers(numbers, _middleRing);
    List<String> insideWords = _checkNumbers(numbers, _insideRing);

    List<String> favorites = _findDictionaryWords([
      outsideWords,
      middleWords,
      insideWords,
    ]);

    final date = DateTime.now();
    final result = Result(
      id: _makeId(numbers),
      numbers: numbers,
      favorites: favorites,
      outsideWords: outsideWords,
      middleWords: middleWords,
      insideWords: insideWords,
      createdAt: date,
      updatedAt: date,
    );
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(resultServiceProvider).setResult(result);
    });
    return result;
  }

  List<String> _checkNumbers(List<int> numbers, List<String> letters) {
    final List<String> words = [];
    for (int i = 0; i < letters.length; i++) {
      String word = '';
      for (int num in numbers) {
        int index = (i + num) % letters.length;
        word += letters[index];
      }
      print(word);
      words.add(word);
    }
    return words;
  }

  List<String> _findDictionaryWords(List<List<String>> allLists) {
    final List<String> dictionary = ref.read(listEnglishWordsProvider);
    final Set<String> dictionaryWords = <String>{};
    for (List<String> list in allLists) {
      for (String word in list) {
        if (dictionary.contains(word.toLowerCase())) {
          print("Found an English word: $word");
          dictionaryWords.add(word);
        }
      }
    }
    return dictionaryWords.toList();
  }

  final _outsideRing = [
    "M",
    "O",
    "M",
    "E",
    "N",
    "T",
    "U",
    "M",
    "R",
    "E",
    "N",
    "E",
    "W",
    "A",
    "L",
    "R",
    "A",
    "D",
    "I",
    "A",
    "N",
    "T",
    "E",
    "M",
    "B",
    "A",
    "R",
    "K",
    "F",
    "L",
    "O",
    "U",
    "R",
    "I",
    "S",
    "H",
    "V",
    "I",
    "T",
    "A",
    "L",
    "I",
    "T",
    "Y",
    "T",
    "H",
    "R",
    "I",
    "V",
    "E",
    "T",
    "R",
    "A",
    "N",
    "S",
    "F",
    "O",
    "R",
    "M",
    "R",
    "E",
    "S",
    "I",
    "L",
    "I",
    "E",
    "N",
    "C",
    "E",
    "E",
    "M",
    "P",
    "O",
    "W",
    "E",
    "R",
    "R",
    "E",
    "V",
    "I",
    "T",
    "A",
    "L",
    "I",
    "Z",
    "E",
    "B",
    "R",
    "E",
    "A",
    "K",
    "T",
    "H",
    "R",
    "O",
    "U",
    "G",
    "H",
    "C",
    "O",
    "N",
    "Q",
    "U",
    "E",
    "R"
  ];
  final _middleRing = [
    "S",
    "U",
    "M",
    "M",
    "I",
    "T",
    "R",
    "O",
    "C",
    "K",
    "S",
    "T",
    "A",
    "R",
    "S",
    "G",
    "O",
    "L",
    "D",
    "E",
    "N",
    "C",
    "H",
    "A",
    "N",
    "C",
    "E",
    "W",
    "E",
    "A",
    "R",
    "T",
    "H",
    "I",
    "S",
    "S",
    "H",
    "I",
    "R",
    "T",
    "J",
    "O",
    "I",
    "N",
    "T",
    "H",
    "E",
    "D",
    "A",
    "N",
    "C",
    "E",
    "\$",
    "1",
    "0",
    "0",
    "0",
    "0",
    "W",
    "A",
    "I",
    "T",
    "S",
    "I",
    "N",
    "D",
    "E",
    "S",
    "E",
    "R",
    "T",
    "S",
    "S",
    "P",
    "A",
    "R",
    "K",
    "F",
    "I",
    "N",
    "D",
    "T",
    "H",
    "E",
    "R",
    "O",
    "C",
    "K",
    "L",
    "I",
    "G",
    "H",
    "T",
    "U",
    "P",
    "T",
    "H",
    "E",
    "D",
    "A",
    "R",
    "K"
  ];
  final _insideRing = [
    "Y",
    "O",
    "U",
    "R",
    "H",
    "E",
    "A",
    "L",
    "T",
    "H",
    "J",
    "O",
    "U",
    "R",
    "N",
    "E",
    "Y",
    "E",
    "X",
    "E",
    "R",
    "C",
    "I",
    "S",
    "E",
    "I",
    "N",
    "D",
    "I",
    "S",
    "G",
    "U",
    "I",
    "S",
    "E",
    "T",
    "H",
    "E",
    "H",
    "U",
    "N",
    "T",
    "H",
    "A",
    "S",
    "B",
    "E",
    "G",
    "U",
    "N",
    "S",
    "U",
    "M",
    "M",
    "I",
    "T",
    "H",
    "A",
    "S",
    "E",
    "V",
    "E",
    "R",
    "Y",
    "T",
    "H",
    "I",
    "N",
    "G"
  ];
}
