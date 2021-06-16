import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:league_dashboard/core/error/failures.dart';
import 'package:league_dashboard/core/usecases/get_list_teams.dart';
import 'package:league_dashboard/core/utils/constants.dart';
import 'package:league_dashboard/screen/players_teams/domain/use_cases/get_teams.dart';

import 'bloc.dart';

class TeamsBloc extends Bloc<TeamsEvent, GetTeamsState> {
  final GetTeams getTeams;

  TeamsBloc({required this.getTeams});

  @override
  GetTeamsState get initialState => LoadingState();

  @override
  Stream<GetTeamsState> mapEventToState(TeamsEvent event) async* {
    print('mapEventToState: ' + event.toString());

    if (event is TeamsLoadedEvent) {

      yield LoadingState();

      final result = await getTeams(GetTeamsParams(leagueId: event.leagueId));

      yield* result.fold((failure) async* {
        if (failure is NoConnectionFailure) {
          yield ErrorState(message: NO_CONNECTION_ERROR);
        } else {
          yield ErrorState(message: GET_TEAMS_ERROR);
        }
      }, (success) async* {
        print('success: ' + success[0].name);

        yield LoadTeamsState(teams: success);
      });
    }
  }
}
