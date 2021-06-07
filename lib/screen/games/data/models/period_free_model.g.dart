// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period_free_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeriodFreeModel _$PeriodFreeModelFromJson(Map<String, dynamic> json) {
  return PeriodFreeModel(
    id: json['id'] as int,
    startDate: json['start_date'] as String,
    addStatusId: json['add_status_id'] as int,
    substadiumId: json['substadium_id'] as int,
    availableStatusId: json['available_status_id'] as int,
    substadium:
        SubstadiumModel.fromJson(json['substadium'] as Map<String, dynamic>),
    addStatus: StatusModel.fromJson(json['add_status'] as Map<String, dynamic>),
    availableStatus:
        StatusModel.fromJson(json['available_status'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PeriodFreeModelToJson(PeriodFreeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_date': instance.startDate,
      'add_status_id': instance.addStatusId,
      'substadium_id': instance.substadiumId,
      'available_status_id': instance.availableStatusId,
      'substadium': instance.substadium,
      'add_status': instance.addStatus,
      'available_status': instance.availableStatus,
    };
