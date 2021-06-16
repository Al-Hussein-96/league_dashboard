
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:league_dashboard/core/error/failures.dart';
import 'package:league_dashboard/core/usecases/usecase.dart';
import 'package:league_dashboard/screen/games/domain/entities/game.dart';
import 'package:league_dashboard/screen/games/domain/repositories/game_repository.dart';
import 'package:league_dashboard/screen/players_teams/domain/entities/team.dart';
import 'package:league_dashboard/screen/players_teams/domain/repositories/team_repository.dart';
import 'package:league_dashboard/screen/players_teams/domain/use_cases/get_teams.dart';

class GetListTeams implements UseCase<List<Game>,TeamsParams>{
  final GameRepository repository;

  GetListTeams({required this.repository});

  @override
  Future<Either<Failure, List<Game>>> call(TeamsParams params) async {
    // TODO: implement call
    return await repository.getGames(1);
  }
}
class TeamsParams extends Equatable{}