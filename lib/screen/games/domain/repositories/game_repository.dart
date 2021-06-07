import 'package:dartz/dartz.dart';
import 'package:league_dashboard/core/error/failures.dart';
import 'package:league_dashboard/screen/games/domain/entities/game.dart';

abstract class GameRepository {
  Future<Either<Failure, List<Game>>> getGames(int leagueId);

}