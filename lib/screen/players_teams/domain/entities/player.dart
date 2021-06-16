import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class Player extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'last_name')
  final String lastName;

  Player({required this.id, required this.name, required this.lastName}) : super([id]);
}
