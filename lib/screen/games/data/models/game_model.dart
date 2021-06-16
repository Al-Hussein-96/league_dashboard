import 'package:json_annotation/json_annotation.dart';
import 'package:league_dashboard/screen/games/data/models/booking_model.dart';
import 'package:league_dashboard/screen/games/domain/entities/game.dart';
import 'package:league_dashboard/screen/players_teams/data/models/team_model.dart';

part 'game_model.g.dart';

@JsonSerializable()
class GameModel extends Game {
  GameModel(
      {required int id,
      required int resultHome,
      required int resultAway,
      required TeamModel homeTeam,
      required TeamModel awayTeam,
      required BookingModel booking,
      required int playStatusId,
      required int officialStatusId})
      : super(
            id: id,
            resultHome: resultHome,
            resultAway: resultAway,
            homeTeam: homeTeam,
            awayTeam: awayTeam,
            booking: booking,
            playStatusId: playStatusId,
            officialStatusId: officialStatusId);

  factory GameModel.fromJson(Map<String, dynamic> json) => _$GameModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameModelToJson(this);
}
