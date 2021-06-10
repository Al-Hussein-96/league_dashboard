import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:league_dashboard/screen/games/domain/entities/status.dart';

class Substadium extends Equatable{
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'image_url')

  final String imageUrl;
  @JsonKey(name: 'name')

  final String name;
  @JsonKey(name: 'stadium_id')
  final int stadiumId;

  Substadium({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.stadiumId,
  }):super([id]);
}
