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
  }) = _Result;

  factory Result.fromJson(Map<String, Object?> json) => _$ResultFromJson(json);
}
