import 'package:flutter/material.dart';
import 'package:league_dashboard/screen/games/presentation/page/games.dart';
import 'package:league_dashboard/screen/home/presentation/page/home.dart';
import 'package:league_dashboard/screen/login/presentation/page/login.dart';
import 'package:league_dashboard/screen/teams/presentation/page/teams.dart';
import 'package:league_dashboard/test.dart';
import 'constants.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN_ROUTE:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case HOME_ROUTE:
        return MaterialPageRoute(builder: (_) => HomePage());
      case TEAMS_ROUTE:
        return MaterialPageRoute(builder: (_) => TeamsPage());
      case TEAMS_ROUTE:
        return MaterialPageRoute(builder: (_) => GamesPage());
      case TEST_ROUTE:
        return MaterialPageRoute(builder: (_) => Counter());
      // case CHANGE_PASSWORD_ROUTE:
      //   return MaterialPageRoute(builder: (_) => ChangePasswordPage());
      default:
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}
