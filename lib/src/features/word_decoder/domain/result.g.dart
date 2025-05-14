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
        (k, e) => MapEntry($enumDecode(_$DecodedListEnumMap, k),
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
          .map((k, e) => MapEntry(_$DecodedListEnumMap[k]!, e)),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$SummitRockYearEnumMap = {
  SummitRockYear.twentyFour: 'twentyFour',
  SummitRockYear.twentyFive: 'twentyFive',
};

const _$DecodedListEnumMap = {
  DecodedList.outsideWords: 'outsideWords',
  DecodedList.outsideWordsWithSpaces: 'outsideWordsWithSpaces',
  DecodedList.middleWords: 'middleWords',
  DecodedList.insideWords: 'insideWords',
  DecodedList.dotsOutside: 'dotsOutside',
  DecodedList.dotsInside: 'dotsInside',
  DecodedList.ticks: 'ticks',
  DecodedList.outsideWordsReverse: 'outsideWordsReverse',
  DecodedList.middleWordsReverse: 'middleWordsReverse',
  DecodedList.insideWordsReverse: 'insideWordsReverse',
  DecodedList.dotsOutsideReverse: 'dotsOutsideReverse',
  DecodedList.dotsInsideReverse: 'dotsInsideReverse',
  DecodedList.ticksReverse: 'ticksReverse',
};
