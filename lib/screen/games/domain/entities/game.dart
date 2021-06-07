import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:league_dashboard/screen/games/data/models/booking_model.dart';
import 'package:league_dashboard/screen/games/domain/entities/Booking.dart';
import 'package:league_dashboard/screen/teams/data/models/team_model.dart';
import 'package:league_dashboard/screen/teams/domain/entities/team.dart';

class Game extends Equatable {
  final int id;
  final int result_home;
  final int result_away;
  final TeamModel home_team;
  final TeamModel away_team;

  final BookingModel booking;
  final int play_status_id;
  final int official_status_id;



  Game({required this.id,required this.result_home, required this.result_away, required this.home_team, required this.away_team,required this.booking,  required this.play_status_id, required this.official_status_id})
      : super([id]);
}
