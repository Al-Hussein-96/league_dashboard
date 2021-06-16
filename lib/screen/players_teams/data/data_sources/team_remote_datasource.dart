import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:league_dashboard/core/error/error.dart';
import 'package:league_dashboard/core/network/rest_client_service.dart';
import 'package:league_dashboard/screen/players_teams/data/models/team_model.dart';
import 'package:league_dashboard/screen/players_teams/domain/entities/team.dart';

abstract class TeamRemoteDataSource {
  Future<List<Team>> getTeams(int leagueId);
}

class TeamRemoteDataSourceImpl extends TeamRemoteDataSource {
  final RestClientService restClientService;

  TeamRemoteDataSourceImpl({required this.restClientService});

  @override
  Future<List<Team>> getTeams(int leagueId) async {

    final response = await restClientService.getTeams(leagueId);
    if (response.statusCode != 200) {
      throw ServerException();
    }
    final body = jsonDecode(response.bodyString)['data'];


    List<Team> teams = (body as List).map((team) => TeamModel.fromJson(team)).toList();

    print('teams: ' + teams.length.toString());
    return teams;
  }
}
