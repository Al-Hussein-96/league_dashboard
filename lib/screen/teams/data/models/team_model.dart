import 'package:json_annotation/json_annotation.dart';

import 'package:league_dashboard/screen/teams/domain/entities/team.dart';

part 'team_model.g.dart';

@JsonSerializable()
class TeamModel extends Team {
  TeamModel({required int id,required String name,required String imageUrl}) : super(id: id,name: name,imageUrl: imageUrl);

  factory TeamModel.fromJson(Map<String, dynamic> json) =>
      _$TeamModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeamModelToJson(this);
}
