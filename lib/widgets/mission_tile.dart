import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/mission_model.dart';
import '../bloc/expansion_bloc.dart';

class MissionTile extends StatelessWidget {
  final Mission mission;

  MissionTile({required this.mission});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExpansionBloc(),
      child: Builder(
        builder: (context) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mission.missionName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  BlocBuilder<ExpansionBloc, ExpansionState>(
                    builder: (context, state) {
                      return Text(
                        state is ExpansionExpanded
                            ? mission.description
                            : (mission.description.length > 50
                                ? mission.description.substring(0, 50) + "..."
                                : mission.description),
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      );
                    },
                  ),
                  if (mission.description.length > 50)
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          context.read<ExpansionBloc>().add(ToggleExpansion());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          child: BlocBuilder<ExpansionBloc, ExpansionState>(
                            builder: (context, state) {
                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    state is ExpansionExpanded
                                        ? "Less"
                                        : "More",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    state is ExpansionExpanded
                                        ? Icons.arrow_drop_up
                                        : Icons.arrow_drop_down,
                                    color: Colors.blue,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 8),
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 6,
                      runSpacing: 6,
                      children: mission.payloadIds.map((id) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Color(
                                    (Random().nextDouble() * 0xFFFFFF).toInt())
                                .withOpacity(1.0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          child: Text(
                            id,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
