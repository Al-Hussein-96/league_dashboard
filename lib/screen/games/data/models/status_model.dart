import 'package:json_annotation/json_annotation.dart';
import 'package:league_dashboard/screen/games/domain/entities/status.dart';

part 'status_model.g.dart';

@JsonSerializable()
class StatusModel extends Status {
  StatusModel({
    required int id,
    required String name,
    required String displayName
  }) : super(id: id,name: name,displayName: displayName);

  factory StatusModel.fromJson(Map<String, dynamic> json) => _$StatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatusModelToJson(this);

}