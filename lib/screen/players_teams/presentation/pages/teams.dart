import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:league_dashboard/core/utils/theme.dart';
import 'package:league_dashboard/screen/players_teams/domain/entities/team.dart';
import 'package:league_dashboard/screen/players_teams/domain/use_cases/get_teams.dart';
import 'package:league_dashboard/screen/players_teams/presentation/bloc_teams/teams_bloc.dart';
import 'package:league_dashboard/screen/players_teams/presentation/bloc_teams/teams_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../injection_container.dart';

class TeamsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
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

  Widget getRow(int i, Team team) {
    final FlutterLogo noImage = FlutterLogo();
    final imageUrl = 'https://cap10.app/${team.imageUrl}';
    return Card(
      child: ListTile(
        leading: noImage,
        title: Text(team.name),
        onTap: () {
          Fluttertoast.showToast(
              msg: "clicked team ${team.name}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              fontSize: 14.0);
        },
      ),
    );
  }

  BlocProvider<TeamsBloc> _buildBody(BuildContext context) {
    return BlocProvider<TeamsBloc>(create: (_) => sl<TeamsBloc>(), child: _buildList(context));
  }

  BlocListener _buildList(BuildContext context) {
    return BlocListener<TeamsBloc, GetTeamsState>(
      listener: (context, state) {
        print('listener state: ' + state.toString());
      },
      child: BlocBuilder<TeamsBloc, GetTeamsState>(
        condition: (previous, current) {
          print('condition : ' + current.toString());
          return true;
        },
        builder: (context, state) {
          print("state: " + state.toString());
          if (state is ErrorState) {
            return const Center(child: Text('No Teams'));
          } else if (state is LoadTeamsState) {
            return SmartRefresher(
              controller: _refreshController,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              child: ListView.builder(
                itemCount: state.teams.length,
                itemBuilder: (BuildContext context, int position) {
                  print('temas: ' + state.teams.length.toString() + ' ' + position.toString());
                  return getRow(position, state.teams[position]);
                },
              ),
            );
          }
          print("stateBuilder: " + state.toString());
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              backgroundColor: CustomColor.green,
            ),
          );
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
