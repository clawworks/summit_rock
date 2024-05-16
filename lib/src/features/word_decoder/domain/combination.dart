import 'package:freezed_annotation/freezed_annotation.dart';

part 'combination.freezed.dart';
part 'combination.g.dart';

@freezed
class Combination with _$Combination {
  const factory Combination({
    required String word,
    required bool favorite,
  }) = _Combination;

  factory Combination.fromJson(Map<String, Object?> json) =>
      _$CombinationFromJson(json);
}
