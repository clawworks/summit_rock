enum WordList {
  outsideWords,
  middleWords,
  insideWords,
  dotsOutside,
  dotsInside,
  ticks;

  @override
  String toString() {
    switch (this) {
      case WordList.outsideWords:
        return 'Outside Words';
      case WordList.middleWords:
        return 'Middle Words';
      case WordList.insideWords:
        return 'Inside Words';
      case WordList.dotsOutside:
        return 'Dots Outside';
      case WordList.dotsInside:
        return 'Dots Inside';
      case WordList.ticks:
        return 'Ticks';
    }
  }
}
