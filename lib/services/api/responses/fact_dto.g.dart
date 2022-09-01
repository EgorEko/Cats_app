// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FactDTO _$FactDTOFromJson(Map<String, dynamic> json) => FactDTO(
      id: json['_id'] as String,
      text: json['text'] as String,
      date: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$FactDTOToJson(FactDTO instance) => <String, dynamic>{
      '_id': instance.id,
      'text': instance.text,
      'updatedAt': instance.date.toIso8601String(),
    };
