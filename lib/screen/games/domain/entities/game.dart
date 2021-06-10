import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:league_dashboard/screen/games/data/models/booking_model.dart';
import 'package:league_dashboard/screen/games/domain/entities/Booking.dart';
import 'package:league_dashboard/screen/teams/data/models/team_model.dart';
import 'package:league_dashboard/screen/teams/domain/entities/team.dart';

class Game extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'result_home')
  final int resultHome;
  @JsonKey(name: 'result_away')
  final int resultAway;
  @JsonKey(name: 'home_team')
  final TeamModel homeTeam;
  @JsonKey(name: 'away_team')
  final TeamModel awayTeam;
  @JsonKey(name: 'booking')
  final BookingModel booking;
  @JsonKey(name: 'play_status_id')
  final int playStatusId;
  @JsonKey(name: 'official_status_id')
  final int officialStatusId;

  Game(
      {required this.id,
      required this.resultHome,
      required this.resultAway,
      required this.homeTeam,
      required this.awayTeam,
      required this.booking,
      required this.playStatusId,
      required this.officialStatusId})
      : super([id]);
}
