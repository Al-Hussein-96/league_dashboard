import 'package:json_annotation/json_annotation.dart';
import 'package:league_dashboard/screen/games/data/models/booking_model.dart';
import 'package:league_dashboard/screen/games/domain/entities/game.dart';
import 'package:league_dashboard/screen/teams/data/models/team_model.dart';

part 'game_model.g.dart';

@JsonSerializable()
class GameModel extends Game {
  GameModel(
      {required int id,
      required int result_home,
      required int result_away,
      required TeamModel home_team,
      required TeamModel away_team,
      required BookingModel booking,
      required int play_status_id,
      required int official_status_id})
      : super(
            id: id,
            result_home: result_home,
            result_away: result_away,
            home_team: home_team,
            away_team: away_team,
            booking: booking,
            play_status_id: play_status_id,
            official_status_id: official_status_id);

  factory GameModel.fromJson(Map<String, dynamic> json) => _$GameModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameModelToJson(this);
}
