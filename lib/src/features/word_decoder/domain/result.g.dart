// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Result _$ResultFromJson(Map<String, dynamic> json) => _Result(
      id: json['id'] as String,
      year: $enumDecodeNullable(_$SummitRockYearEnumMap, json['year']) ??
          SummitRockYear.twentyFour,
      numbers: (json['numbers'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      letterMap: (json['letterMap'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), e as String),
      ),
      favorites:
          (json['favorites'] as List<dynamic>).map((e) => e as String).toList(),
      decodedWords: (json['decodedWords'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$EncodedListEnumMap, k),
            (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ResultToJson(_Result instance) => <String, dynamic>{
      'id': instance.id,
      'year': _$SummitRockYearEnumMap[instance.year]!,
      'numbers': instance.numbers,
      'letterMap': instance.letterMap.map((k, e) => MapEntry(k.toString(), e)),
      'favorites': instance.favorites,
      'decodedWords': instance.decodedWords
          .map((k, e) => MapEntry(_$EncodedListEnumMap[k]!, e)),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$SummitRockYearEnumMap = {
  SummitRockYear.twentyFour: 'twentyFour',
  SummitRockYear.twentyFive: 'twentyFive',
};

const _$EncodedListEnumMap = {
  EncodedList.outsideWords: 'outsideWords',
  EncodedList.outsideWordsWithSpaces: 'outsideWordsWithSpaces',
  EncodedList.middleWords: 'middleWords',
  EncodedList.insideWords: 'insideWords',
  EncodedList.dotsOutside: 'dotsOutside',
  EncodedList.dotsInside: 'dotsInside',
  EncodedList.ticks: 'ticks',
  EncodedList.outsideWordsReverse: 'outsideWordsReverse',
  EncodedList.middleWordsReverse: 'middleWordsReverse',
  EncodedList.insideWordsReverse: 'insideWordsReverse',
  EncodedList.dotsOutsideReverse: 'dotsOutsideReverse',
  EncodedList.dotsInsideReverse: 'dotsInsideReverse',
  EncodedList.ticksReverse: 'ticksReverse',
  EncodedList.outsideLetters25: 'outsideLetters25',
  EncodedList.ticks25: 'ticks25',
  EncodedList.outsideLettersReverse25: 'outsideLettersReverse25',
  EncodedList.ticksReverse25: 'ticksReverse25',
};
