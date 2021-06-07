import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:league_dashboard/core/error/error.dart';
import 'package:league_dashboard/core/network/rest_client_service.dart';
import 'package:league_dashboard/screen/games/data/models/game_model.dart';
import 'package:league_dashboard/screen/games/domain/entities/game.dart';

abstract class GameRemoteDataSource {
  Future<List<Game>> getGames(int leagueId);
}

class GameRemoteDataSourceImpl extends GameRemoteDataSource {
  final RestClientService restClientService;

  GameRemoteDataSourceImpl({required this.restClientService});

  @override
  Future<List<Game>> getGames(int leagueId) async {

    final response = await restClientService.getGames(leagueId);
    if (response.statusCode != 200) {
      throw ServerException();
    }
    print('games: ' + response.bodyString);

    final body = jsonDecode(response.bodyString)['data'];


    List<Game> games = (body as List).map((game) => GameModel.fromJson(game)).toList();

    print('games: ' + games.length.toString());
    return games;
  }
}
