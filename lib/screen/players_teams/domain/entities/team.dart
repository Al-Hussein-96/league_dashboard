

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

class Team extends Equatable{
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'image_url')
  final String imageUrl;

  Team({required this.id,required this.name,required this.imageUrl}): super([id]);
}