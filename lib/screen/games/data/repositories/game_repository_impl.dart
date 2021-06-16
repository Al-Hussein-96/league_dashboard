import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:league_dashboard/core/error/error.dart';
import 'package:league_dashboard/core/error/failures.dart';
import 'package:league_dashboard/core/network/network_info.dart';
import 'package:league_dashboard/screen/games/data/datasource/game_remote_datasource.dart';
import 'package:league_dashboard/screen/games/domain/entities/game.dart';
import 'package:league_dashboard/screen/games/domain/repositories/game_repository.dart';
import 'package:league_dashboard/screen/players_teams/data/data_sources/team_remote_datasource.dart';

class GameRepositoryImpl implements GameRepository {
  final GameRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  GameRepositoryImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Game>>> getGames(int leagueId) async {
    // TODO: implement getTeams
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.getGames(leagueId);
        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
