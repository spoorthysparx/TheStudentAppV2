import 'package:http/http.dart' as http;
import 'dart:convert';

import '../secrets.dart';
import 'dashboard.model.dart';

class DashboardController {
  static Future<DashboardModel> fetchDashboard() async {
    final response = await http.get(Uri.parse("$baseUrl/dashboard"));
    if (response.statusCode == 200) {
      Map<String, dynamic> res = jsonDecode(response.body);
      List<GenericModel> jobs = [];
      List<GenericModel> studentOpportunities = [];
      List<GenericModel> currentAffairs = [];
      List<GenericModel> trainingOpportunities = [];
      for (var job in res["job-alerts"]) {
        jobs.add(GenericModel.fromJson(job));
      }
      for (var opportunity in res["student-opportunities"]) {
        studentOpportunities.add(GenericModel.fromJson(opportunity));
      }
      for (var affairs in res["current-affairs"]) {
        currentAffairs.add(GenericModel.fromJson(affairs));
      }
      for (var opportunity in res["training-opportunities"]) {
        trainingOpportunities.add(GenericModel.fromJson(opportunity));
      }
      return DashboardModel(
        jobs: jobs,
        studentOpportunities: studentOpportunities,
        currentAffairs: currentAffairs,
        trainingOpportunities: trainingOpportunities,
      );
    } else {
      throw Exception("Could not load data");
    }
  }
}
