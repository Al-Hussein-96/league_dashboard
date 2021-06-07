import 'package:equatable/equatable.dart';
import 'package:league_dashboard/screen/games/data/models/status_model.dart';
import 'package:league_dashboard/screen/games/data/models/substadium_model.dart';
import 'package:league_dashboard/screen/games/domain/entities/status.dart';
import 'package:league_dashboard/screen/games/domain/entities/substadium.dart';

class PeriodFree extends Equatable {
  int id;
  String startDate;
  int addStatusId;
  int substadiumId;
  int availableStatusId;
  SubstadiumModel substadium;
  StatusModel addStatus;
  StatusModel availableStatus;


  PeriodFree(
      {required this.id,
      required this.startDate,
      required this.addStatusId,
      required this.substadiumId,
      required this.availableStatusId,
      required this.substadium,
      required this.addStatus,
      required this.availableStatus}):super([id]);
}
