import 'package:flutter/material.dart';
import 'package:sih/categories/current_affairs.dart';
import 'package:sih/categories/job_alert.dart';
import 'package:sih/categories/training_opportunities.dart';

import 'package:sih/dashboard/dashboard.view.dart';
import 'package:sih/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Dashboard',
          ),
        ),
        endDrawer: drawer(),
        body:Dashboard(),
      ),
      routes: {
job_alerts.routename:(ctx) => job_alerts(),
// student_opportunity.routename:(ctx) =>student_opportunity(),
curren_affairs.routename:(ctx) => curren_affairs(),
training_opportunities.routename:(ctx) =>training_opportunities(), 
      },
    );
  }
}
