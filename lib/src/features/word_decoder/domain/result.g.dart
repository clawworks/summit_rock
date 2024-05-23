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
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
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
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
