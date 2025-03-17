import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/mission_bloc.dart';
import 'screens/mission_screen.dart';
import 'services/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MissionBloc(apiService: ApiService()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SpaceX Missions',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MissionScreen(),
      ),
    );
  }
}
