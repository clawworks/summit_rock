import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summit_rock/src/utilities/enums/decoded_list.dart';

part 'result.freezed.dart';
part 'result.g.dart';

/// * The product identifier is an important concept and can have its own type.
typedef ResultId = String;

@freezed
class Result with _$Result {
  const Result._();

  const factory Result({
    required ResultId id,
    required List<int> numbers,
    required Map<int, String> letterMap,
    required List<String> favorites,
    required Map<DecodedList, List<String>> decodedWords,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Result;

  factory Result.fromJson(Map<String, Object?> json) => _$ResultFromJson(json);

  String get combined {
    String title = '';
    for (int i = 0; i < numbers.length; i++) {
      final String trailing = i != numbers.length - 1 ? ', ' : '';
      String? letter = letterMap[i];
      if (letter != null) {
        title += '$letter$trailing';
      }
      title += '${numbers[i]}$trailing';
    }
    return title;
  }

  // factory Result.fromMap(Map<String, dynamic> map) {
  //   final String id = map['id'];
  //
  //   final numbersDynamic = map['numbers'] as List<dynamic>?;
  //   List<int> numbers =
  //       numbersDynamic is Iterable ? List<int>.from(numbersDynamic ?? []) : [];
  //
  //   final outsideDynamic = map['outsideCombinations'] as List<dynamic>?;
  //   List<Combination> outsideCombinations = outsideDynamic is Iterable
  //       ? List<Combination>.from(outsideDynamic ?? [])
  //       : [];
  //
  //   final middleDynamic = map['middleCombinations'] as List<dynamic>?;
  //   List<Combination> middleCombinations = middleDynamic is Iterable
  //       ? List<Combination>.from(middleDynamic ?? [])
  //       : [];
  //
  //   final insideDynamic = map['insideCombinations'] as List<dynamic>?;
  //   List<Combination> insideCombinations = insideDynamic is Iterable
  //       ? List<Combination>.from(insideDynamic ?? [])
  //       : [];
  //
  //   return Result(
  //     id: id,
  //     numbers: numbers,
  //     outsideCombinations: outsideCombinations,
  //     middleCombinations: middleCombinations,
  //     insideCombinations: insideCombinations,
  //   );
  // }
  //
  // Map<String, dynamic> toMap() => {
  //       'id': id,
  //       'numbers': numbers,
  //       'outsideCombinations': outsideCombinations,
  //       'middleCombinations': middleCombinations,
  //       'insideCombinations': insideCombinations
  //     };
}
