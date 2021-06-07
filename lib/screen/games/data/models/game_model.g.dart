// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) {
  print('GameModelFromJson');
  return GameModel(
    id: json['id'] as int,
    result_home: json['result_home'] as int,
    result_away: json['result_away'] as int,
    home_team: TeamModel.fromJson(json['home_team'] as Map<String, dynamic>),
    away_team: TeamModel.fromJson(json['away_team'] as Map<String, dynamic>),
    booking: BookingModel.fromJson(json['booking_paid'] as Map<String, dynamic>),
    play_status_id: json['play_status_id'] as int,
    official_status_id: json['official_status_id'] as int,
  );
}

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
      'id': instance.id,
      'result_home': instance.result_home,
      'result_away': instance.result_away,
      'home_team': instance.home_team,
      'away_team': instance.away_team,
      'booking_paid': instance.booking,
      'play_status_id': instance.play_status_id,
      'official_status_id': instance.official_status_id,
    };
