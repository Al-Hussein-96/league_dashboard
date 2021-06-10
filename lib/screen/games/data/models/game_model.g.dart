// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) {
  return GameModel(
    id: json['id'] as int,
    resultHome: json['result_home'] as int,
    resultAway: json['result_away'] as int,
    homeTeam: TeamModel.fromJson(json['home_team'] as Map<String, dynamic>),
    awayTeam: TeamModel.fromJson(json['away_team'] as Map<String, dynamic>),
    booking: BookingModel.fromJson(json['booking'] as Map<String, dynamic>),
    playStatusId: json['play_status_id'] as int,
    officialStatusId: json['official_status_id'] as int,
  );
}

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
      'id': instance.id,
      'result_home': instance.resultHome,
      'result_away': instance.resultAway,
      'home_team': instance.homeTeam,
      'away_team': instance.awayTeam,
      'booking': instance.booking,
      'play_status_id': instance.playStatusId,
      'official_status_id': instance.officialStatusId,
    };
