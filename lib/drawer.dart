import 'package:flutter/material.dart';

class drawer extends StatelessWidget {
  Widget buildListTile(String title, VoidCallback tapHandler) {
    return ListTile(
      
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          buildListTile('job alerts',(){
            Navigator.of(context).pushNamed('/job_alerts');
          }),
          // buildListTile('studentOpportunities',() {
            // Navigator.of(context).pushNamed('/student_opportunities');
          // }),
          buildListTile('currentAffairs',() {
            Navigator.of(context).pushNamed('/current_affairs');
          }),
          buildListTile('trainingOpportunities',() {
            Navigator.of(context).pushNamed('/training_opportunities');
          })
        ],
      ),
    );
  }
}