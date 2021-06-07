import 'package:json_annotation/json_annotation.dart';
import 'package:league_dashboard/screen/games/domain/entities/status.dart';
import 'package:league_dashboard/screen/games/domain/entities/substadium.dart';

part 'substadium_model.g.dart';

@JsonSerializable()
class SubstadiumModel extends Substadium {
  SubstadiumModel({required int id, required String imageUrl, required String name, required int stadiumId})
      : super(id: id, imageUrl: imageUrl,name: name,stadiumId: stadiumId);

  factory SubstadiumModel.fromJson(Map<String, dynamic> json) => _$SubstadiumModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubstadiumModelToJson(this);
}
