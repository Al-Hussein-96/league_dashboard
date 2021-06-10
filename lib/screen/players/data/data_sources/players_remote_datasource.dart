import 'dart:convert';

import 'package:league_dashboard/core/error/error.dart';
import 'package:league_dashboard/core/network/rest_client_service.dart';
import 'package:league_dashboard/screen/players_teams/domain/entities/player_stats.dart';

abstract class PlayerRemoteDataSource {
  Future<List<PlayerStats>> getPlayers(int teamId,int leagueId);
}

class TeamRemoteDataSourceImpl extends PlayerRemoteDataSource {
  final RestClientService restClientService;

  TeamRemoteDataSourceImpl({required this.restClientService});

  @override
  Future<List<PlayerStats>> getPlayers(int teamId,int leagueId) async {
    // TODO: implement getPlayers
    final response = await restClientService.getLeagueTeamPlayers(teamId,leagueId);

    if (response.statusCode != 200) {
      throw ServerException();
    }
    final body = jsonDecode(response.bodyString)['data'];


    List<PlayerStats> playersStats = (body as List).map((team) => PlayerStatsModel.fromJson(team)).toList();

    print('player stats list: ' + playersStats.length.toString());
    return playersStats;  }
}
