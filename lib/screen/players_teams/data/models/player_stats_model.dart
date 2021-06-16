import 'package:json_annotation/json_annotation.dart';
import 'package:league_dashboard/screen/players_teams/domain/entities/player.dart';
import 'package:league_dashboard/screen/players_teams/domain/entities/player_stats.dart';

part 'player_stats_model.g.dart';

@JsonSerializable()
class PlayerStatsModel extends PlayerStats {
  PlayerStatsModel(
      {
        required int goalsCount,
      required int asstCount,
      required int yellowCardCount,
      required int redCardCount,
      required int defensiveRescueCount,
      required int goalkeeperSavesCount,
      required int gamesManOfTheMatchCount,
      required Player player})
      : super(
            goalsCount: goalsCount,
            asstCount: asstCount,
            yellowCardCount: yellowCardCount,
            redCardCount: redCardCount,
            defensiveRescueCount: defensiveRescueCount,
            goalkeeperSavesCount: goalkeeperSavesCount,
            gamesManOfTheMatchCount: gamesManOfTheMatchCount,
            player: player);

  factory PlayerStatsModel.fromJson(Map<String, dynamic> json) => _$PlayerStatsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerStatsModelToJson(this);
}
