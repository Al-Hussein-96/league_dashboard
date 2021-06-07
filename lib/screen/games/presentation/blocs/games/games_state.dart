import 'package:equatable/equatable.dart';
import 'package:league_dashboard/screen/games/domain/entities/game.dart';
import 'package:meta/meta.dart';

@immutable
abstract class GetGamesState extends Equatable {
  GetGamesState([List props = const <dynamic>[]]) : super(props);
}

class NotLoggedState extends GetGamesState {}

class LoadingState extends GetGamesState {}

class LoadGamesState extends GetGamesState {
  final List<Game> games;

  LoadGamesState({required this.games}) : super([games]);
}

class ErrorState extends GetGamesState {
  final String message;

  ErrorState({required this.message}) : super([message]);
}
