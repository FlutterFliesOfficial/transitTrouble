import 'package:flutter/material.dart';

class BridgesImplementationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bridges Implementation'),
        backgroundColor: Colors.red, // Customize the color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bridges Overview',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Bridges are essential infrastructure that connect different areas and facilitate transportation. This screen provides details on bridge design, construction methods, and maintenance practices.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'Key Features:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // You can use ListView or Column to list key features
            _buildFeatureItem('1. Structural Integrity'),
            _buildFeatureItem('2. Load Capacity'),
            _buildFeatureItem('3. Materials Used'),
            _buildFeatureItem('4. Environmental Impact'),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Navigate to another screen or perform an action
                print("More Information about Bridges");
                // For example, navigate to a detailed page about bridge design
              },
              child: Text('Learn More'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String feature) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        feature,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
