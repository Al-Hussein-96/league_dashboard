import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:league_dashboard/core/error/failures.dart';
import 'package:league_dashboard/core/usecases/usecase.dart';
import 'package:league_dashboard/screen/players_teams/domain/entities/player_stats.dart';
import 'package:league_dashboard/screen/players_teams/domain/repositories/player_repository.dart';

class GetPlayers implements UseCase<List<PlayerStats>, GetPlayersParams> {
  final PlayerRepository repository;

  GetPlayers({required this.repository});

  @override
  Future<Either<Failure, List<PlayerStats>>> call(GetPlayersParams params) async {
    // TODO: implement call
    return await repository.getPlayers(params.teamId,params.leagueId);
  }
}

class GetPlayersParams extends Equatable {
  final int teamId;
  final int leagueId;

  GetPlayersParams({required this.teamId,required this.leagueId}) : super([teamId,leagueId]);
}
