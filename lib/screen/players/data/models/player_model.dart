import 'package:json_annotation/json_annotation.dart';
import 'package:league_dashboard/screen/players/domain/entities/player.dart';

part 'player_model.g.dart';

@JsonSerializable()
class PlayerModel extends Player {

  PlayerModel({required int id, required String name, required String lastName})
      : super(id: id, name: name, lastName: lastName);


  factory PlayerModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerModelToJson(this);


}
