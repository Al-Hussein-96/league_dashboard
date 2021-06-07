
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:league_dashboard/core/error/failures.dart';
import 'package:league_dashboard/core/usecases/usecase.dart';
import 'package:league_dashboard/screen/games/domain/entities/game.dart';
import 'package:league_dashboard/screen/games/domain/repositories/game_repository.dart';


class GetGames implements UseCase<List<Game>,GetGamesParams>{
  final GameRepository repository;


  GetGames({required this.repository});

  @override
  Future<Either<Failure, List<Game>>> call(GetGamesParams params) async {
    // TODO: implement call
    return await repository.getGames(params.leagueId);
  }



}

class GetGamesParams extends Equatable {
  final int leagueId;

  GetGamesParams({required this.leagueId}): super([leagueId]);
}