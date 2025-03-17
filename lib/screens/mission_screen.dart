import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/mission_bloc.dart';
import '../bloc/mission_event.dart';
import '../bloc/mission_state.dart';
import '../widgets/mission_tile.dart';

class MissionScreen extends StatefulWidget {
  @override
  _MissionScreenState createState() => _MissionScreenState();
}

class _MissionScreenState extends State<MissionScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MissionBloc>().add(FetchMissions());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SpaceX Missions")),
      body: BlocBuilder<MissionBloc, MissionState>(
        builder: (context, state) {
          if (state is MissionLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MissionLoaded) {
            return ListView.builder(
              itemCount: state.missions.length,
              itemBuilder: (context, index) {
                return MissionTile(mission: state.missions[index]);
              },
            );
          } else if (state is MissionError) {
            return Center(child: Text(state.error));
          }
          return Center(child: Text("No missions available"));
        },
      ),
    );
  }
}
