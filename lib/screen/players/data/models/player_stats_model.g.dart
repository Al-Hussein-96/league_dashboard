// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerStatsModel _$PlayerStatsModelFromJson(Map<String, dynamic> json) {
  return PlayerStatsModel(
    goalsCount: json['goals_count'] as int,
    asstCount: json['asst_count'] as int,
    yellowCardCount: json['yellow_card_count'] as int,
    redCardCount: json['red_card_count'] as int,
    defensiveRescueCount: json['defensive_rescue_count'] as int,
    goalkeeperSavesCount: json['goalkeeper_saves_count'] as int,
    gamesManOfTheMatchCount: json['games_man_of_the_match_count'] as int,
    player: json['player'],
  );
}

Map<String, dynamic> _$PlayerStatsModelToJson(PlayerStatsModel instance) =>
    <String, dynamic>{
      'goals_count': instance.goalsCount,
      'asst_count': instance.asstCount,
      'yellow_card_count': instance.yellowCardCount,
      'red_card_count': instance.redCardCount,
      'defensive_rescue_count': instance.defensiveRescueCount,
      'goalkeeper_saves_count': instance.goalkeeperSavesCount,
      'games_man_of_the_match_count': instance.gamesManOfTheMatchCount,
      'player': instance.player,
    };
