import 'package:freezed_annotation/freezed_annotation.dart';

part 'rock_number.g.dart';

@JsonEnum(alwaysCreate: true)
enum RockNumber {
  @JsonValue('miniOne')
  miniOne,
  @JsonValue('miniTwo')
  miniTwo,
  @JsonValue('miniThree')
  miniThree,
  @JsonValue('bigOne')
  bigOne,
  @JsonValue('bigTwo')
  bigTwo,
  @JsonValue('bigThree')
  bigThree;

  @override
  String toString() {
    switch (this) {
      case RockNumber.miniOne:
        return 'Mini Rock One';
      case RockNumber.miniTwo:
        return 'Mini Rock Two';
      case RockNumber.miniThree:
        return 'Mini Rock Three';
      case RockNumber.bigOne:
        return 'Big Rock One';
      case RockNumber.bigTwo:
        return 'Big Rock Two';
      case RockNumber.bigThree:
        return 'Big Rock Three';
    }
  }
}

// @riverpod
// RockNumber rockNumber(RockNumberRef ref) {
//   return RockNumber.miniOne;
// }
