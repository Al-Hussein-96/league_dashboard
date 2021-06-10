import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:league_dashboard/screen/games/data/models/period_free_model.dart';
import 'package:league_dashboard/screen/games/data/models/status_model.dart';
import 'package:league_dashboard/screen/games/domain/entities/period_free.dart';
import 'package:league_dashboard/screen/games/domain/entities/status.dart';

class Booking extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'booking_status_id')
  final int bookingStatusId;
  @JsonKey(name: 'period_free')
  final PeriodFreeModel periodFree;
  @JsonKey(name: 'booking_status')
  final StatusModel bookingStatus;

  Booking(
      {required this.id,
      required this.bookingStatusId,
      required this.periodFree,
      required this.bookingStatus})
      : super([id]);
}
