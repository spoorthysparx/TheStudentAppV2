import 'package:flutter/material.dart';
import 'package:sih/dashboard/dashboard.controller.dart';
import 'package:sih/dashboard/dashboard.model.dart';
class training_opportunities extends StatefulWidget {
  static const routename='/training_opportunities';

  @override
  State<training_opportunities> createState() => _training_opportunitiesState();
}

class _training_opportunitiesState extends State<training_opportunities> {
  @override
 Widget buildcard(GenericModel item) => Card(
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Container(
          child: Column(children: [
            Expanded(
              child: Image.network(
                item.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Text(item.title),
            Expanded(
              child: Text(
                item.description,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Text(item.type),
          ]),
          width: 300,
          height: 200,
          decoration: const BoxDecoration(
            // color: Colors.cyan.shade300,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          margin: const EdgeInsets.all(10),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Dashboard',
          ),
        ),
      body: FutureBuilder(
        future: DashboardController.fetchDashboard(),
        builder: (BuildContext ctx, AsyncSnapshot<DashboardModel> snapshot) {
          DashboardModel dash = snapshot.data as DashboardModel;
          return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Training Opportunities',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 1000,
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: 8,
                    separatorBuilder: (context, _) => const SizedBox(
                          width: 2,
                        ),
                    itemBuilder: (context, index) =>
                        buildcard(dash.trainingOpportunities[index])),
              )
                ],
              ),
            )
          ;
        },
      ),
    );
  }
  }
