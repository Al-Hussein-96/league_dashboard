// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../players_teams/data/models/team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamModel _$TeamModelFromJson(Map<String, dynamic> json) {
  return TeamModel(
    id: json['id'] as int,
    name: json['name'] as String,
    imageUrl: json['image_url'] as String,
  );
}

Map<String, dynamic> _$TeamModelToJson(TeamModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
    };
