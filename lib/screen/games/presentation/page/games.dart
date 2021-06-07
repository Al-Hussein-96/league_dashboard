import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:league_dashboard/core/utils/theme.dart';
import 'package:league_dashboard/screen/games/domain/entities/game.dart';
import 'package:league_dashboard/screen/games/presentation/blocs/games/bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../injection_container.dart';

class GamesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample App'),
      ),
      body: _buildBody(context),
      // body: BlocProvider(
      //   create: (_) => TeamsBloc(getTeams: getTeams),
      //   child: _buildBody(context),
      // )
    );
  }

  Widget getRow(int i, Game game) {
    final FlutterLogo noImage = FlutterLogo();
    return Container(
      height: 60,
      child: Card(
        margin: EdgeInsets.only(top: 1),
        color: CustomColor.dark_blue,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 80),
              child: Text(
                game.home_team.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: CustomColor.white),
              ),
            ),
            SizedBox(width: 8),
            new Container(
              width: 35.0,
              height: 35.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage("https://i.imgur.com/BoN9kdC.png"),
                ),
              ),
            ),
            SizedBox(width: 5),
            new Container(
              width: 40.0,
              height: 40.0,
              alignment: Alignment.center,
              child: Text(
                '${game.result_home}',
                style: const TextStyle(fontSize: 16, color: CustomColor.white),
              ),
              decoration: new BoxDecoration(shape: BoxShape.circle, color: CustomColor.statusBarColor),
            ),
            SizedBox(width: 5),
            Center(
                child: Text(
              ":",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: CustomColor.white),
            )),
            Row(
              children: [
                SizedBox(width: 5),
                new Container(
                  width: 40.0,
                  height: 40.0,
                  alignment: Alignment.center,
                  child: Text(
                    '${game.result_away}',
                    style: const TextStyle(fontSize: 16, color: CustomColor.white),
                  ),
                  decoration: new BoxDecoration(shape: BoxShape.circle, color: CustomColor.statusBarColor),
                ),
                SizedBox(width: 5),
                new Container(
                  width: 35.0,
                  height: 35.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage("https://i.imgur.com/BoN9kdC.png"),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 85),
                  child: Text(game.away_team.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: CustomColor.white,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BlocProvider<GamesBloc> _buildBody(BuildContext context) {
    return BlocProvider<GamesBloc>(create: (_) => sl<GamesBloc>(), child: _buildList(context));
  }

  BlocListener _buildList(BuildContext context) {
    return BlocListener<GamesBloc, GetGamesState>(
      listener: (context, state) {
        print('listener state: ' + state.toString());
      },
      child: BlocBuilder<GamesBloc, GetGamesState>(
        condition: (previous, current) {
          print('condition : ' + current.toString());
          return true;
        },
        builder: (context, state) {
          print("state: " + state.toString());
          if (state is ErrorState) {
            return const Center(child: Text('No Teams'));
          } else if (state is LoadGamesState) {
            return SmartRefresher(
              controller: _refreshController,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              child: ListView.builder(
                itemCount: state.games.length,
                itemBuilder: (BuildContext context, int position) {
                  print('teams: ' + state.games.length.toString() + ' ' + position.toString());
                  return getRow(position, state.games[position]);
                },
              ),
            );
          }
          print("stateBuilder: " + state.toString());
          return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: CustomColor.green,
          ));
        },
      ),
    );
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()

    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    setState(() {});
    _refreshController.loadComplete();
  }
}
