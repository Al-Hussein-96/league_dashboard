import 'package:json_annotation/json_annotation.dart';

import 'Player.dart';

class PlayerStats {
  @JsonKey(name: 'goals_count')
  int goalsCount;

  @JsonKey(name: 'asst_count')
  int asstCount;

  @JsonKey(name: 'yellow_card_count')
  int yellowCardCount;

  @JsonKey(name: 'red_card_count')
  int redCardCount;

  @JsonKey(name: 'defensive_rescue_count')
  int defensiveRescueCount;

  @JsonKey(name: 'goalkeeper_saves_count')
  int goalkeeperSavesCount;

  @JsonKey(name: 'games_man_of_the_match_count')
  int gamesManOfTheMatchCount;

  @JsonKey(name: 'player')
  Player player;

  PlayerStats(
      {required this.goalsCount,
      required this.asstCount,
      required this.yellowCardCount,
      required this.redCardCount,
      required this.defensiveRescueCount,
      required this.goalkeeperSavesCount,
      required this.gamesManOfTheMatchCount,
      required this.player});
}
