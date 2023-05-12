// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RatingDto _$$_RatingDtoFromJson(Map<String, dynamic> json) => _$_RatingDto(
      source: json['Source'] as String? ?? 'N/A',
      value: json['Value'] as String? ?? '0',
    );

Map<String, dynamic> _$$_RatingDtoToJson(_$_RatingDto instance) =>
    <String, dynamic>{
      'Source': instance.source,
      'Value': instance.value,
    };
