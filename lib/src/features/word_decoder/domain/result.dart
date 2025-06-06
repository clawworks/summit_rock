import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summit_rock/src/utilities/enums/encoded_lists.dart';
import 'package:summit_rock/src/utilities/enums/rock_number.dart';

import '../../settings/domain/summit_rock_year.dart';

part 'result.freezed.dart';
part 'result.g.dart';

/// * The result identifier is an important concept and can have its own type.
typedef ResultId = String;

@freezed
abstract class Result with _$Result {
  const Result._();

  const factory Result({
    required ResultId id,
    @Default(SummitRockYear.twentyFour) SummitRockYear year,
    required List<int> numbers,
    required Map<int, String> letterMap,
    required List<String> favorites,
    required Map<EncodedList, List<String>> decodedWords,
    required DateTime createdAt,
    required DateTime updatedAt,
    RockNumber? rockNumber,
  }) = _Result;

  factory Result.fromJson(Map<String, Object?> json) => _$ResultFromJson(json);

  String get combined {
    String title = '';
    String? lastLetter = letterMap[numbers.length];
    for (int i = 0; i < numbers.length; i++) {
      final bool showTrailingComma =
          i != numbers.length - 1 || lastLetter != null;
      final String trailing = showTrailingComma ? ', ' : '';
      String? letter = letterMap[i];
      if (letter != null) {
        title += '$letter$trailing';
      }
      title += '${numbers[i]}$trailing';
    }
    if (lastLetter != null) {
      title += lastLetter;
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
