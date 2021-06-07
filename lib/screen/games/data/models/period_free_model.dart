import 'package:json_annotation/json_annotation.dart';
import 'package:league_dashboard/screen/games/data/models/status_model.dart';
import 'package:league_dashboard/screen/games/data/models/substadium_model.dart';
import 'package:league_dashboard/screen/games/domain/entities/period_free.dart';
import 'package:league_dashboard/screen/games/domain/entities/status.dart';
import 'package:league_dashboard/screen/games/domain/entities/substadium.dart';

part 'period_free_model.g.dart';

@JsonSerializable()
class PeriodFreeModel extends PeriodFree {
  PeriodFreeModel({
    required int id,
    required String startDate,
    required int addStatusId,
    required int substadiumId,
    required int availableStatusId,
    required SubstadiumModel substadium,
    required StatusModel addStatus,
    required StatusModel availableStatus

  }) : super(id: id,
      startDate: startDate,
      addStatusId: addStatusId,
      substadiumId: substadiumId,
      availableStatusId: availableStatusId,
      substadium: substadium,
      addStatus: addStatus,
      availableStatus: availableStatus);

  factory PeriodFreeModel.fromJson(Map<String, dynamic> json) => _$PeriodFreeModelFromJson(json);

  Map<String, dynamic> toJson() => _$PeriodFreeModelToJson(this);

}