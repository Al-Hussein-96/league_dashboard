import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:league_dashboard/screen/players_teams/domain/use_cases/get_players.dart';

import 'bloc.dart';


class PlayersBloc extends Bloc<PlayersEvent, PlayersState> {
  final GetPlayers getPlayers;


  PlayersBloc({required this.getPlayers});

  @override
  PlayersState get initialState => LoadingState();

  @override
  Stream<PlayersState> mapEventToState(
    PlayersEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }


}
