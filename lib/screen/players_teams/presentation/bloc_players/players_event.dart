
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class PlayersEvent extends Equatable {
  PlayersEvent([List props = const <dynamic>[]]) : super(props);
}


class PlayersTeamLoadedEvent extends PlayersEvent {
  final int leagueId;
  final int teamId;

  PlayersTeamLoadedEvent(this.leagueId, this.teamId);
}
