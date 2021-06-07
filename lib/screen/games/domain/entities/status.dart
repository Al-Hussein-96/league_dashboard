import 'package:equatable/equatable.dart';

class Status extends Equatable {
  final int id;
  final String name;
  final String displayName;

  Status(
      {required this.id,
      required this.name,
      required this.displayName,}):super([id]);
}
