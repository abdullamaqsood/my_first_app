import 'package:flutter/material.dart';

void main() {
  runApp(const CaseTrackerApp());
}

class CaseTrackerApp extends StatelessWidget {
  const CaseTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const CaseTrackerScreen(),
    );
  }
}

class CaseTrackerScreen extends StatelessWidget {
  const CaseTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Case Tracker",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: DataPoint.values.length,
          itemBuilder: (context, index) {
            return _buildCaseStat(DataPoint.values[index]);
          },
        ),
      ),
    );
  }

  Widget _buildCaseStat(DataPoint data) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align title to the left
        children: [
          Text(
            data.name,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: data.color),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    data.assetPath,
                    height: 40,
                    width: 40,
                    color: data.color,
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              Text(
                _getCaseValue(data),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: data.color),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getCaseValue(DataPoint data) {
    switch (data) {
      case DataPoint.casesTotal:
        return "9,231,249";
      case DataPoint.casesActive:
        return "123,214";
      case DataPoint.deaths:
        return "51,245";
      case DataPoint.recovered:
        return "7,452,340";
    }
  }
}

enum DataPoint {
  casesTotal('Total Cases', 'assets/count.png', Color(0xFFFFF492)),
  casesActive('Active Cases', 'assets/fever.png', Color(0xFFE99600)),
  deaths('Deaths', 'assets/death.png', Color(0xFFE40000)),
  recovered('Recovered', 'assets/patient.png', Color(0xFF70A901));

  const DataPoint(this.name, this.assetPath, this.color);
  final String name;
  final String assetPath;
  final Color color;
}
