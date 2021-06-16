import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:league_dashboard/core/utils/constants.dart';
import 'package:league_dashboard/core/utils/router.dart';
import 'package:league_dashboard/core/utils/theme.dart';
import 'package:league_dashboard/core/widget/custom_snak_bar.dart';
import 'package:league_dashboard/screen/games/presentation/page/games.dart';
import 'package:league_dashboard/screen/login/presentation/blocs/user_login/user_login_bloc.dart';
import 'package:league_dashboard/screen/login/presentation/blocs/user_login/user_login_event.dart';
import 'package:league_dashboard/screen/login/presentation/blocs/user_login/user_login_state.dart';
import 'package:league_dashboard/screen/players_teams/presentation/pages/teams.dart';
import 'package:league_dashboard/screen/players_teams/presentation/pages/teams_player.dart';

import '../../../../injection_container.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _HomePageState2();
  }
}

class _HomePageState2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "Home";
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: myWidget(context),
      ),
    );
  }
}

class GridLayout {
  final int id;
  final String title;
  final IconData icon;

  GridLayout({required this.id, required this.title, required this.icon});
}

List<GridLayout> options = [
  GridLayout(id: 1, title: 'Teams', icon: Icons.group),
  GridLayout(id: 2, title: 'Standing', icon: Icons.sort),
  GridLayout(id: 3, title: 'Games', icon: Icons.sports_soccer),
  GridLayout(id: 4, title: 'Player', icon: Icons.person),
];

Widget myWidget(BuildContext context) {
  return GridView.custom(
    padding: EdgeInsets.all(10.0),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
    ),
    childrenDelegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) => GridOptions(

        layout: options[index],

      ),
      childCount: 4,
    ),
  );
}

class GridOptions extends StatelessWidget {
  final GridLayout layout;

  GridOptions({required this.layout});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch(layout.id){
          case 1:
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new TeamsPage()));
            break;
          case 3:
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new GamesPage()));
            break;
          case 4:
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new TeamsPlayerPage()));
            break;
        }

      },
      child: Card(
        color: CustomColor.dark_blue_transpercy,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                layout.icon,
                size: 36,
                color: CustomColor.green,
              ),
              Text(
                layout.title,
                style: TextStyle(fontSize: 24, color: CustomColor.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
