import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:league_dashboard/core/error/error.dart';
import 'package:league_dashboard/core/error/failures.dart';
import 'package:league_dashboard/core/network/network_info.dart';
import 'package:league_dashboard/screen/login/data/datasources/login_local_datasource.dart';
import 'package:league_dashboard/screen/login/data/datasources/login_remote_datasource.dart';
import 'package:league_dashboard/screen/login/domain/entities/login.dart';
import 'package:league_dashboard/screen/login/domain/repositories/login_repository.dart';
import 'package:league_dashboard/screen/players_teams/data/data_sources/team_remote_datasource.dart';
import 'package:league_dashboard/screen/players_teams/domain/entities/team.dart';
import 'package:league_dashboard/screen/players_teams/domain/repositories/team_repository.dart';

class TeamRepositoryImpl implements TeamRepository {
  final TeamRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TeamRepositoryImpl(
      {required this.remoteDataSource,
      required this.networkInfo});



  @override
  Future<Either<Failure, List<Team>>> getTeams(int leagueId) async {

    // TODO: implement getTeams
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.getTeams(leagueId);
        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
