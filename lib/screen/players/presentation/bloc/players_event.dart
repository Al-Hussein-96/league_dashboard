part of 'players_bloc.dart';

@immutable
abstract class PlayersEvent extends Equatable {
  PlayersEvent([List props = const <dynamic>[]]) : super(props);
}

class TeamsLoadedEvent extends PlayersEvent {
  final int leagueId;

  TeamsLoadedEvent(this.leagueId);
}

class PlayersTeamLoadedEvent extends PlayersEvent {
  final int leagueId;
  final int teamId;

  PlayersTeamLoadedEvent(this.leagueId, this.teamId);
}
