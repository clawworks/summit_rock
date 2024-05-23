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
      outsideCombinations: (json['outsideCombinations'] as List<dynamic>)
          .map((e) => Combination.fromJson(e as Map<String, dynamic>))
          .toList(),
      middleCombinations: (json['middleCombinations'] as List<dynamic>)
          .map((e) => Combination.fromJson(e as Map<String, dynamic>))
          .toList(),
      insideCombinations: (json['insideCombinations'] as List<dynamic>)
          .map((e) => Combination.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ResultImplToJson(_$ResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'numbers': instance.numbers,
      'outsideCombinations':
          instance.outsideCombinations.map((e) => e.toJson()).toList(),
      'middleCombinations':
          instance.middleCombinations.map((e) => e.toJson()).toList(),
      'insideCombinations':
          instance.insideCombinations.map((e) => e.toJson()).toList(),
    };
