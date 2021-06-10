// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) {
  return BookingModel(
    id: json['id'] as int,
    bookingStatusId: json['booking_status_id'] as int,
    periodFree:
        PeriodFreeModel.fromJson(json['period_free'] as Map<String, dynamic>),
    bookingStatus:
        StatusModel.fromJson(json['booking_status'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BookingModelToJson(BookingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'booking_status_id': instance.bookingStatusId,
      'period_free': instance.periodFree,
      'booking_status': instance.bookingStatus,
    };
