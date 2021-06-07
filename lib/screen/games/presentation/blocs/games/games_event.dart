import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class GamesEvent extends Equatable {
  GamesEvent([List props = const <dynamic>[]]) : super(props);
}

class GamesLoadedEvent extends GamesEvent {
  final int leagueId;

  GamesLoadedEvent(this.leagueId);
}

// class SkipLoginEvent extends TeamsEvent {}
