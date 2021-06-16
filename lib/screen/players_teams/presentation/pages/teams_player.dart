import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:league_dashboard/screen/players_teams/data/models/team_model.dart';
import 'package:league_dashboard/screen/players_teams/domain/entities/team.dart';
import 'package:league_dashboard/screen/players_teams/presentation/bloc_teams/bloc.dart';
import 'package:league_dashboard/screen/players_teams/presentation/bloc_teams/teams_bloc.dart';

import '../../../../injection_container.dart';

class TeamsPlayerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPlayerPage> {
  double val = 0;
  late List<Team> list;
  late Team dropdownCountryValue;

  void change() {
    setState(() {
      val += 1;
    });
  }

  Widget build(BuildContext context) {
    DropdownMenuItem<String> item1 = DropdownMenuItem(child: Text('Hello'));
    DropdownMenuItem item2 = DropdownMenuItem(child: Text('world'));
    DropdownMenuItem item3 = DropdownMenuItem(child: Text('english'));
    DropdownMenuItem item4 = DropdownMenuItem(child: Text('arabic'));

    return Scaffold(
      appBar: AppBar(
        title: Text('Teams Player'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<TeamsBloc>(
            create: (BuildContext context) => sl<TeamsBloc>(),
          ),
        ],
        child: Column(
          children: [
            _buildDropDown(context),
          ],
        ),
      ),
    );
  }

  _buildDropDown(BuildContext context) {
    return BlocListener<TeamsBloc, GetTeamsState>(
      listener: (context, state) {
        print('BlocListener state: ' + state.toString());
      },
      child: Container(
        alignment: Alignment.topCenter,
        child: BlocBuilder<TeamsBloc, GetTeamsState>(
          builder: (context, state) {

            if(state is GetTeamsState) {

              print('BlocBuilder state: ' + state.toString());
              return DropdownButton<Team>(
                onChanged: (value) {
                  setState(() {
                    print('on Change');
                    print(value);
                    dropdownCountryValue = value!;
                  });
                },
                items: state.map<DropdownMenuItem<Team>>((Team value) {
                  return DropdownMenuItem<Team>(
                    value: value,
                    child: Text(value.name),
                  );
                }).toList(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
