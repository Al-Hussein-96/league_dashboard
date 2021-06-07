import 'package:equatable/equatable.dart';
import 'package:league_dashboard/screen/games/data/models/period_free_model.dart';
import 'package:league_dashboard/screen/games/data/models/status_model.dart';
import 'package:league_dashboard/screen/games/domain/entities/period_free.dart';
import 'package:league_dashboard/screen/games/domain/entities/status.dart';

class Booking extends Equatable {
  int id;
  int bookingStatusId;
  PeriodFreeModel periodFree;
  StatusModel bookingStatus;

  Booking(
      {required this.id,
      required this.bookingStatusId,
      required this.periodFree,
      required this.bookingStatus}):super([id]);
}
