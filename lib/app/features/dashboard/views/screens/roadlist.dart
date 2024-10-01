import 'package:flutter/material.dart';
import 'package:hell_o/app/features/dashboard/views/screens/road.dart';

class RoadListScreen extends StatelessWidget {
  final List<String> roads = [
    'Highway 1',
    'Main Street',
    'River Road',
    'Mountain Pass',
    'Coastal Highway',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Road Audit List'),
      ),
      body: ListView.builder(
        itemCount: roads.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(roads[index]),
            onTap: () {
              // Navigate to PredictiveMaintenanceScreen on tap
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PredictiveMaintenanceScreen(roadName: roads[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
