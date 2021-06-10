import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class Status extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'display_name')
  final String displayName;

  Status(
      {required this.id,
      required this.name,
      required this.displayName,}):super([id]);
}
