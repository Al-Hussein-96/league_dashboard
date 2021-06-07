import 'package:dartz/dartz.dart';
import 'package:league_dashboard/core/error/failures.dart';
import 'package:league_dashboard/screen/teams/domain/entities/team.dart';

abstract class TeamRepository {
  Future<Either<Failure, List<Team>>> getTeams(int leagueId);

}