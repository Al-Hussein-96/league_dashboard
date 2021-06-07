import 'package:json_annotation/json_annotation.dart';
import 'package:league_dashboard/screen/games/data/models/period_free_model.dart';
import 'package:league_dashboard/screen/games/data/models/status_model.dart';
import 'package:league_dashboard/screen/games/domain/entities/Booking.dart';
import 'package:league_dashboard/screen/games/domain/entities/period_free.dart';
import 'package:league_dashboard/screen/games/domain/entities/status.dart';

part 'booking_model.g.dart';


@JsonSerializable()
class BookingModel extends Booking {
  BookingModel({required int id,
    required int bookingStatusId,
    required PeriodFreeModel periodFree,
    required StatusModel bookingStatus,
  })
      : super(
      id: id,
      bookingStatusId: bookingStatusId,
      bookingStatus: bookingStatus,
      periodFree: periodFree);

  factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingModelToJson(this);
}
