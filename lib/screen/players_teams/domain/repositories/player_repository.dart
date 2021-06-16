import 'package:dartz/dartz.dart';
import 'package:league_dashboard/core/error/failures.dart';
import 'package:league_dashboard/screen/players_teams/domain/entities/player_stats.dart';

abstract class PlayerRepository {
  Future<Either<Failure, List<PlayerStats>>> getPlayers(int teamId,int leagueId);
}
