import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/mission_model.dart';

class ApiService {
  static const String url = "https://api.spacexdata.com/v3/missions";

  Future<List<Mission>> fetchMissions() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Mission.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load missions");
    }
  }
}
