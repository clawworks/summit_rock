import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:summit_rock/src/features/word_decoder/application/result_service.dart';
import 'package:summit_rock/src/features/word_decoder/domain/combination.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';

part 'word_decoder_controller.g.dart';
//
// @riverpod
// List<Combination> outsideWords(OutsideWordsRef ref) {
//   return [];
// }
//
// @riverpod
// List<Combination> middleWords(MiddleWordsRef ref) {
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

  Future<void> getResults() async {
    List<int> numbers = ref.read(numberListProvider);
    List<Combination> outsideCombos =
        ref.read(outsideCombosProvider.notifier).checkNumbers();
    List<Combination> middleCombos =
        ref.read(middleCombosProvider.notifier).checkNumbers();
    List<Combination> insideCombos =
        ref.read(insideCombosProvider.notifier).checkNumbers();
    final date = DateTime.now();
    final result = Result(
      id: _makeId(numbers),
      numbers: numbers,
      outsideCombinations: outsideCombos,
      middleCombinations: middleCombos,
      insideCombinations: insideCombos,
      createdAt: date,
      updatedAt: date,
    );
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(resultServiceProvider).setResult(result);
    });
    ref.read(numberListProvider.notifier).clearNumbers();
  }
}

@riverpod
class OutsideCombos extends _$OutsideCombos {
  @override
  List<Combination> build() {
    // Nothing to do, no state
    return [];
  }

  void addCombo(Combination combo) {
    state = [...state, combo];
  }

  void clearCombos() {
    state = [];
  }

  void toggleFavorite(Combination combo) {
    // combo.favorite = !combo.favorite;
    state = [
      for (final c in state)
        if (c.word == combo.word)
          // Mark only the matching combo as favorite
          // Make a copy since the state is immutable.
          c.copyWith(favorite: !c.favorite)
        else
          // Other combos are not modified
          c,
    ];
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

  List<Combination> checkNumbers() {
    final numbers = ref.read(numberListProvider);
    print("Words from the Outside Ring:");
    for (int i = 0; i < _outsideRing.length; i++) {
      String word = '';
      for (int num in numbers) {
        int index = (i + num) % _outsideRing.length;
        word += _outsideRing[index];
      }
      print(word);
      final combo = Combination(word: word, favorite: false);
      // TODO check if word is in dictionary, of so favorite it
      addCombo(combo);
    }
    print("Outside Ring State: $state");
    return state;
  }
}

@riverpod
class MiddleCombos extends _$MiddleCombos {
  @override
  List<Combination> build() {
    // Nothing to do, no state
    return [];
  }

  void addCombo(Combination combo) {
    state = [...state, combo];
  }

  void clearCombos() {
    state = [];
  }

  void toggleFavorite(Combination combo) {
    // combo.favorite = !combo.favorite;

    state = [
      for (final c in state)
        if (c.word == combo.word)
          // Mark only the matching combo as favorite
          // Make a copy since the state is immutable.
          c.copyWith(favorite: !c.favorite)
        else
          // Other combos are not modified
          c,
    ];
  }

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

  List<Combination> checkNumbers() {
    final numbers = ref.read(numberListProvider);
    print("Words from the Middle Ring:");
    for (int i = 0; i < _middleRing.length; i++) {
      String word = '';
      for (int num in numbers) {
        int index = (i + num) % _middleRing.length;
        word += _middleRing[index];
      }
      print(word);
      final combo = Combination(word: word, favorite: false);
      // TODO check if word is in dictionary and mark as favorite
      addCombo(combo);
    }
    print("Middle Ring State: $state");
    return state;
  }
}

@riverpod
class InsideCombos extends _$InsideCombos {
  @override
  List<Combination> build() {
    // Nothing to do, no state
    return [];
  }

  void addCombo(Combination combo) {
    state = [...state, combo];
  }

  void clearCombos() {
    state = [];
  }

  void toggleFavorite(Combination combo) {
    // combo.favorite = !combo.favorite;

    state = [
      for (final c in state)
        if (c.word == combo.word)
          // Mark only the matching combo as favorite
          // Make a copy since the state is immutable.
          c.copyWith(favorite: !c.favorite)
        else
          // Other combos are not modified
          c,
    ];
  }

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
    "G",
  ];

  List<Combination> checkNumbers() {
    final numbers = ref.read(numberListProvider);
    print("Words from the Inside Ring:");
    for (int i = 0; i < _insideRing.length; i++) {
      String word = '';
      for (int num in numbers) {
        int index = (i + num) % _insideRing.length;
        word += _insideRing[index];
      }
      print(word);
      final combo = Combination(word: word, favorite: false);
      // TODO check if word is in dictionary and mark as favorite
      addCombo(combo);
    }
    print("Inside Ring State: $state");
    return state;
  }
}

@riverpod
class NumberList extends _$NumberList {
  @override
  List<int> build() {
    // Nothing to do, no state
    return [];
  }

  void addNumber(int number) {
    state = [...state, number];
  }

  void clearNumbers() {
    state = [];
  }

//   List<String> checkNumbers() {
//     final List<String> outsideWords = [];
//     final List<String> middleWords = [];
//     print("Words from the Outside Ring:");
//     for (int i = 0; i < _outsideRing.length; i++) {
//       String word = '';
//       for (int j = 0; j < state.length; j++) {
//         // index = (i+x) % len(innerCircle)
//         int index = (i + j) % _outsideRing.length;
//         word += _outsideRing[index];
//       }
//       print(word);
//       outsideWords.add(word);
//     }
  //   print("Words from the Middle Ring:");
  //   for (int i = 0; i < _middleRing.length; i++) {
  //     String word = '';
  //     for (int j = 0; j < state.length; j++) {
  //       // index = (i+x) % len(innerCircle)
  //       int index = (i + j) % _middleRing.length;
  //       word += _middleRing[index];
  //     }
  //     print(word);
  //     middleWords.add(word);
  //   }
  //   return [...outsideWords, ...middleWords];
  // }
}

// # Summit Rock Clue Decoder 2023
// # Written for Morgan Young by Chandler Young
// # 06/14/2023
//
// import subprocess
//
// innerCircle = ["k","o","n","y","c","o","u","n","t","r","y","w","a","s","h","i","n","g","t","o","n","p","l","a","n","e","t","s","t","g","e","o","r","g","e","t","h","e","h","a","w","k","i","v","i","n","s","s","u","n","n","y","s","a","n","t","a","c","l","a","r","a","t","h","e","f","a","n","s","p","o","r","t","s","n","e","t","w","o","r","k","b","l","o","o","m","i","n","g","t","o","n","9","6","x","s","t","g","e","o","r","g","e","n","e","w","s","r","a","d","i","o","r","o","c","k",]
//
// outerCircle = ["w","e","i","g","h","t","t","r","a","i","n","i","n","g","c","a","r","d","i","o","t","h","e","t","u","r","f","b","a","s","k","e","t","b","a","l","l","c","l","a","s","s","e","s","y","o","g","a","s","p","i","n","b","i","k","e","w","a","l","k","f","i","t","n","e","s","s","a","q","u","a","t","i","c","s","t","e","n","n","i","s","p","i","c","k","l","e","b","a","l","l","s","m","o","o","t","h","i","e","p","r","o","s","h","o","p","k","i","d","s","c","l","u","b","s","w","i","m","m","i","n","g","l","o","u","n","g","e",]
//
// inputNumbers = input("Please enter the decoding numbers separated by a comma (eg 3,53,2,78):\n")
//
// numStrings = inputNumbers.split(",")
// nums = [int(s) for s in numStrings]
//
// print(f"Words from the Inner Circle:")
// innerWords = []
// for i in range(len(innerCircle)):
// word = ''
// for x in nums:
// index = (i+x) % len(innerCircle)
// word+=innerCircle[index]
// print(word)
// innerWords.append(word)
//
// print(f"Words from the Outer Circle:")
// outerWords = []
// for i in range(len(outerCircle)):
// word = ''
// for x in nums:
// index = (i+x) % len(outerCircle)
// word+=outerCircle[index]
// print(word)
// outerWords.append(word)
//
// wordMessage = f"Inner Circle Words:\n{innerWords}\nOuter Circle Words:\n{outerWords}"
// subprocess.run("pbcopy", text=True, input=wordMessage)
// print("Words have been copied to your clipboard!")
