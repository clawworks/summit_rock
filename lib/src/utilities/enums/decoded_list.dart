enum DecodedList {
  outsideWords,
  outsideWordsWithSpaces,
  middleWords,
  insideWords,
  dotsOutside,
  dotsInside,
  ticks,
  outsideWordsReverse,
  middleWordsReverse,
  insideWordsReverse,
  dotsOutsideReverse,
  dotsInsideReverse,
  ticksReverse;

  @override
  String toString() {
    switch (this) {
      case DecodedList.outsideWords:
        return 'Outside Words';
      case DecodedList.outsideWordsWithSpaces:
        return 'Outside Words With Spaces';
      case DecodedList.middleWords:
        return 'Middle Words';
      case DecodedList.insideWords:
        return 'Inside Words';
      case DecodedList.dotsOutside:
        return 'Dots Outside';
      case DecodedList.dotsInside:
        return 'Dots Inside';
      case DecodedList.ticks:
        return 'Ticks';
      case DecodedList.outsideWordsReverse:
        return 'Outside Words Reverse';
      case DecodedList.middleWordsReverse:
        return 'Middle Words Reverse';
      case DecodedList.insideWordsReverse:
        return 'Inside Words Reverse';
      case DecodedList.dotsOutsideReverse:
        return 'Dots Outside Reverse';
      case DecodedList.dotsInsideReverse:
        return 'Dots Inside Reverse';
      case DecodedList.ticksReverse:
        return 'Ticks Reverse';
    }
  }
}
