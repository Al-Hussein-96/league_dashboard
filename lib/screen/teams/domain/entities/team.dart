

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Team extends Equatable{
  final int id;
  final String name;
  final String image_url;

  Team({required this.id,required this.name,required this.image_url}): super([id]);
}