import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TeamsEvent extends Equatable {
  TeamsEvent([List props = const <dynamic>[]]) : super(props);
}

class TeamsLoadedEvent extends TeamsEvent {
  final int leagueId;

  TeamsLoadedEvent(this.leagueId);
}

// class SkipLoginEvent extends TeamsEvent {}
