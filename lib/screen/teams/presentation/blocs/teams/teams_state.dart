import 'package:equatable/equatable.dart';
import 'package:league_dashboard/screen/login/domain/entities/login.dart';
import 'package:league_dashboard/screen/teams/domain/entities/team.dart';
import 'package:meta/meta.dart';

@immutable
abstract class GetTeamsState extends Equatable {
  GetTeamsState([List props = const <dynamic>[]]) : super(props);
}

class NotLoggedState extends GetTeamsState {}

class LoadingState extends GetTeamsState {}

class LoadTeamsState extends GetTeamsState {
  final List<Team> teams;

  LoadTeamsState({required this.teams}) : super([teams]);
}

class ErrorState extends GetTeamsState {
  final String message;

  ErrorState({required this.message}) : super([message]);
}
