import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:league_dashboard/core/error/failures.dart';
import 'package:league_dashboard/core/utils/constants.dart';
import 'package:league_dashboard/screen/games/domain/usecases/get_games.dart';

import 'bloc.dart';

class GamesBloc extends Bloc<GamesEvent, GetGamesState> {
  final GetGames getGames;

  GamesBloc({required this.getGames});

  @override
  GetGamesState get initialState => LoadingState();

  @override
  Stream<GetGamesState> mapEventToState(GamesEvent event) async* {
    print('mapEventToState: ' + event.toString());

    if (event is GamesLoadedEvent) {

      yield LoadingState();

      final result = await getGames(GetGamesParams(leagueId: event.leagueId));

      yield* result.fold((failure) async* {
        if (failure is NoConnectionFailure) {
          yield ErrorState(message: NO_CONNECTION_ERROR);
        } else {
          yield ErrorState(message: GET_GAMES_ERROR);
        }
      }, (success) async* {

        yield LoadGamesState(games: success,);
      });
    }
  }
}
