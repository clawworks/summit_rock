import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:summit_rock/src/features/settings/domain/summit_rock_year.dart';

part 'encoded_lists.g.dart';

@riverpod
List<EncodedList> encodedLists(Ref ref) {
  final SummitRockYear year = ref.watch(yearSelectionProvider);

  return EncodedList.values.where((list) => list.year == year).toList();
}

enum EncodedList {
  outsideWords(year: SummitRockYear.twentyFour),
  outsideWordsWithSpaces(year: SummitRockYear.twentyFour),
  middleWords(year: SummitRockYear.twentyFour),
  insideWords(year: SummitRockYear.twentyFour),
  dotsOutside(year: SummitRockYear.twentyFour),
  dotsInside(year: SummitRockYear.twentyFour),
  ticks(year: SummitRockYear.twentyFour),
  outsideWordsReverse(year: SummitRockYear.twentyFour),
  middleWordsReverse(year: SummitRockYear.twentyFour),
  insideWordsReverse(year: SummitRockYear.twentyFour),
  dotsOutsideReverse(year: SummitRockYear.twentyFour),
  dotsInsideReverse(year: SummitRockYear.twentyFour),
  ticksReverse(year: SummitRockYear.twentyFour),
  outsideLetters25(year: SummitRockYear.twentyFive),
  ticks25(year: SummitRockYear.twentyFive),
  outsideLettersReverse25(year: SummitRockYear.twentyFive),
  ticksReverse25(year: SummitRockYear.twentyFive);

  const EncodedList({required this.year});

  final SummitRockYear year;

  @override
  String toString() {
    switch (this) {
      case EncodedList.outsideWords:
        return 'Outside Words';
      case EncodedList.outsideWordsWithSpaces:
        return 'Outside Words With Spaces';
      case EncodedList.middleWords:
        return 'Middle Words';
      case EncodedList.insideWords:
        return 'Inside Words';
      case EncodedList.dotsOutside:
        return 'Dots Outside';
      case EncodedList.dotsInside:
        return 'Dots Inside';
      case EncodedList.ticks25:
      case EncodedList.ticks:
        return 'Ticks';
      case EncodedList.outsideWordsReverse:
        return 'Outside Words Reverse';
      case EncodedList.middleWordsReverse:
        return 'Middle Words Reverse';
      case EncodedList.insideWordsReverse:
        return 'Inside Words Reverse';
      case EncodedList.dotsOutsideReverse:
        return 'Dots Outside Reverse';
      case EncodedList.dotsInsideReverse:
        return 'Dots Inside Reverse';
      case EncodedList.outsideLetters25:
        return 'Outside Letters';
      case EncodedList.outsideLettersReverse25:
        return 'Outside Letters Reverse';
      case EncodedList.ticksReverse25:
      case EncodedList.ticksReverse:
        return 'Ticks Reverse';
    }
  }
}
