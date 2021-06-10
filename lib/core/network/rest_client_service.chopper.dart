// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$RestClientService extends RestClientService {
  _$RestClientService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = RestClientService;

  Future<Response> loginUser(String jsonBody) {
    final $url = 'https://cap10.app/api/stadium_owner/login_auth';

    // final $url = 'BASE_URL/login_auth';
    final $headers = {'Content-type': 'application/json'};
    final $body = jsonBody;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> logoutUser(String jsonBody, String token) {
    final $url = 'BASE_URL/tokens';
    final $headers = {
      'Authorization': token,
      'Content-type': 'application/json'
    };
    final $body = jsonBody;
    final $request =
        Request('DELETE', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> changePassword(String jsonBody) {
    final $url = 'BASE_URL/create';
    final $headers = {'Content-type': 'application/json'};
    final $body = jsonBody;
    final $request =
        Request('PUT', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> getTeams(int jsonParam) async {
    // TODO: implement getTeams

    final $url = 'https://cap10.app/api/league/get_teams';
    final $headers = {'Content-type': 'application/json'};

    final $parameter = Map<String, dynamic>();

    $parameter['league_id'] = jsonParam;

    // print("RestClientService: getteams response: 1: $jsonParam" + );

    // final Map<String, int> $parameter = jsonDecode(jsonParam);
    print($parameter);

    final $request = Request('GET', $url, client.baseUrl,parameters: $parameter,headers: $headers);
    print("request: " + $request.parameters.toString());

    // client.send($request);
    return await client.send<dynamic,dynamic>($request);
  }

  @override
  Future<Response> getGames(int jsonParam) async {
    // TODO: implement getTeams

    final $url = 'https://cap10.app/api/game_details/get_games';
    final $headers = {'Content-type': 'application/json'};

    final $parameter = Map<String, dynamic>();

    $parameter['recorder_id'] = jsonParam;

    // print("RestClientService: getteams response: 1: $jsonParam" + );

    // final Map<String, int> $parameter = jsonDecode(jsonParam);
    print($parameter);

    final $request = Request('GET', $url, client.baseUrl,parameters: $parameter,headers: $headers);
    print("request: " + $request.parameters.toString());

    // client.send($request);
    return await client.send<dynamic,dynamic>($request);
  }

  @override
  Future<Response> getLeagueTeamPlayers(int teamId, int leagueId) async {
    // TODO: implement getTeams

    final $url = 'https://cap10.app/api/$GET_PLAYERS_TEAM_LEAGUE';
    final $headers = {'Content-type': 'application/json'};

    final $parameter = Map<String, dynamic>();

    $parameter['league_id'] = leagueId;
    $parameter['team_id'] = teamId;

    // print("RestClientService: getteams response: 1: $jsonParam" + );

    // final Map<String, int> $parameter = jsonDecode(jsonParam);
    print($parameter);

    final $request = Request('GET', $url, client.baseUrl,parameters: $parameter,headers: $headers);
    print("request: " + $request.parameters.toString());

    // client.send($request);
    return await client.send<dynamic,dynamic>($request);
  }

}
