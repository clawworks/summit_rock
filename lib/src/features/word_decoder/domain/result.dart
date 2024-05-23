import 'package:freezed_annotation/freezed_annotation.dart';

import 'combination.dart';

part 'result.freezed.dart';
part 'result.g.dart';

/// * The product identifier is an important concept and can have its own type.
typedef ResultId = String;

@freezed
class Result with _$Result {
  const factory Result({
    required ResultId id,
    required List<int> numbers,
    required List<Combination> outsideCombinations,
    required List<Combination> middleCombinations,
    required List<Combination> insideCombinations,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Result;

  factory Result.fromJson(Map<String, Object?> json) => _$ResultFromJson(json);

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
