// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultImpl _$$ResultImplFromJson(Map<String, dynamic> json) => _$ResultImpl(
      id: json['id'] as String,
      numbers: (json['numbers'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      favorites:
          (json['favorites'] as List<dynamic>).map((e) => e as String).toList(),
      decodedWords: (json['decodedWords'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$DecodedListEnumMap, k),
            (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ResultImplToJson(_$ResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'numbers': instance.numbers,
      'favorites': instance.favorites,
      'decodedWords': instance.decodedWords
          .map((k, e) => MapEntry(_$DecodedListEnumMap[k]!, e)),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$DecodedListEnumMap = {
  DecodedList.outsideWords: 'outsideWords',
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
