
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:league_dashboard/core/error/failures.dart';
import 'package:league_dashboard/core/usecases/usecase.dart';
import 'package:league_dashboard/screen/teams/domain/entities/team.dart';
import 'package:league_dashboard/screen/teams/domain/repositories/team_repository.dart';


class GetTeams implements UseCase<List<Team>,GetTeamsParams>{
  final TeamRepository repository;


  GetTeams({required this.repository});

  @override
  Future<Either<Failure, List<Team>>> call(GetTeamsParams params) async {
    // TODO: implement call
    return await repository.getTeams(params.leagueId);
  }



}

class GetTeamsParams extends Equatable {
  final int leagueId;

  GetTeamsParams({required this.leagueId}): super([leagueId]);
}