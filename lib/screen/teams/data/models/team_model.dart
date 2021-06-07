import 'package:json_annotation/json_annotation.dart';

import 'package:flutter/cupertino.dart';
import 'package:league_dashboard/screen/teams/domain/entities/team.dart';

part 'team_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TeamModel extends Team {
  TeamModel({required int id,required String name,required String image_url}) : super(id: id,name: name,image_url: image_url);

  factory TeamModel.fromJson(Map<String, dynamic> json) =>
      _$TeamModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeamModelToJson(this);
}
