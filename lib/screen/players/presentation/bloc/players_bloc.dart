import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:league_dashboard/screen/players/domain/use_cases/get_players.dart';
import 'package:league_dashboard/screen/teams/domain/entities/team.dart';
import 'package:meta/meta.dart';

part 'players_event.dart';
part 'players_state.dart';

class PlayersBloc extends Bloc<PlayersEvent, PlayersState> {
  final GetPlayers

  PlayersBloc() : super(PlayersInitial());

  @override
  // TODO: implement initialState
  PlayersState get initialState => throw UnimplementedError();

  @override
  Stream<PlayersState> mapEventToState(
    PlayersEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }


}
