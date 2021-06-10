import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:league_dashboard/screen/games/data/models/status_model.dart';
import 'package:league_dashboard/screen/games/data/models/substadium_model.dart';
import 'package:league_dashboard/screen/games/domain/entities/status.dart';
import 'package:league_dashboard/screen/games/domain/entities/substadium.dart';

class PeriodFree extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'start_date')
  final String startDate;
  @JsonKey(name: 'add_status_id')
  final int addStatusId;
  @JsonKey(name: 'substadium_id')
  final int substadiumId;
  @JsonKey(name: 'available_status_id')
  final int availableStatusId;
  @JsonKey(name: 'substadium')
  final SubstadiumModel substadium;
  @JsonKey(name: 'add_status')
  final StatusModel addStatus;
  @JsonKey(name: 'available_status')
  final StatusModel availableStatus;

  PeriodFree(
      {required this.id,
      required this.startDate,
      required this.addStatusId,
      required this.substadiumId,
      required this.availableStatusId,
      required this.substadium,
      required this.addStatus,
      required this.availableStatus})
      : super([id]);
}
