
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:league_dashboard/screen/players_teams/domain/entities/team.dart';

@immutable
abstract class PlayersState extends Equatable {
  PlayersState([List props = const <dynamic>[]]) : super(props);
}

class LoadingState extends PlayersState {}

class LoadTeamsState extends PlayersState {
  final List<Team> teams;

  LoadTeamsState({required this.teams}) : super([teams]);
}

class LoadPlayersTeamState extends PlayersState {
  final List<PlayersState> playersStats;

  LoadPlayersTeamState({required this.playersStats}) : super([playersStats]);
}

class ErrorState extends PlayersState {
  final String message;

  ErrorState({required this.message}) : super([message]);
}
