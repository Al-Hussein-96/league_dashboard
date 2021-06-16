


import 'package:dartz/dartz.dart';
import 'package:league_dashboard/core/error/error.dart';
import 'package:league_dashboard/core/error/failures.dart';
import 'package:league_dashboard/core/network/network_info.dart';
import 'package:league_dashboard/screen/players_teams/data/data_sources/players_remote_datasource.dart';
import 'package:league_dashboard/screen/players_teams/domain/entities/player_stats.dart';
import 'package:league_dashboard/screen/players_teams/domain/repositories/player_repository.dart';

class PlayerRepositoryImpl implements PlayerRepository{
  final PlayerRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  PlayerRepositoryImpl({required this.remoteDataSource,required this.networkInfo});

  @override
  Future<Either<Failure, List<PlayerStats>>> getPlayers(int teamId, int leagueId) async {
    // TODO: implement getPlayers


    // TODO: implement getTeams
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.getPlayers(teamId,leagueId);
        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }




}