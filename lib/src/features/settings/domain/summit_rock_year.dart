import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'summit_rock_year.g.dart';

@JsonEnum(alwaysCreate: true)
enum SummitRockYear {
  @JsonValue('twentyFour')
  twentyFour,
  @JsonValue('twentyFive')
  twentyFive;

  @override
  String toString() {
    switch (this) {
      case twentyFour:
        return '2024';
      case twentyFive:
        return '2025';
    }
  }
}

// final yearSelectionProvider =
//     NotifierProvider.autoDispose<YearSelection, SummitRockYear>(() {
//   return YearSelection();
// });

@Riverpod(keepAlive: true)
class YearSelection extends _$YearSelection {
  @override
  SummitRockYear build() {
    return SummitRockYear.twentyFour;
  }

  void set(SummitRockYear year) {
    state = year;
  }
}
