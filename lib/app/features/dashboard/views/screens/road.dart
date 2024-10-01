import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hell_o/app/features/dashboard/views/components/line_chart.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
// Make sure this import contains your primaryColor and secondaryColor

// Assuming your ViewLineChart is in a separate file

class PredictiveMaintenanceScreen extends StatelessWidget {
  final String roadName;

  const PredictiveMaintenanceScreen({Key? key, required this.roadName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Predictive Maintenance for $roadName'),
      ),
      body: Row(
        children: [
          // Left Side: Line Chart (70% width)
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Maintenance Trend',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 16),

                  // Replace the existing LineChart with the ViewLineChart widget
                  Expanded(
                    child:
                        ViewLineChart(), // Using the provided custom Line Chart
                  ),
                ],
              ),
            ),
          ),

          // Right Side: Gauge Meter (30% width)
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Equipment Health',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 20),

                  // Responsive Gauge based on screen dimensions
                  SizedBox(
                    width:
                        screenWidth * 0.25, // 25% of screen width for the gauge
                    height: screenHeight *
                        0.4, // 40% of screen height for the gauge
                    child: SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(
                          minimum: 0,
                          maximum: 100,
                          ranges: <GaugeRange>[
                            GaugeRange(
                              startValue: 0,
                              endValue: 50,
                              color: Colors.red,
                            ),
                            GaugeRange(
                              startValue: 50,
                              endValue: 75,
                              color: Colors.yellow,
                            ),
                            GaugeRange(
                              startValue: 75,
                              endValue: 100,
                              color: Colors.green,
                            ),
                          ],
                          pointers: <GaugePointer>[
                            NeedlePointer(
                              value: 70,
                              needleColor: Colors.blue,
                              knobStyle: KnobStyle(color: Colors.blue),
                            ),
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                              widget: Container(
                                child: Text(
                                  '70%',
                                  style: TextStyle(
                                    fontSize: screenWidth *
                                        0.03, // Adjust text size based on screen width
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              positionFactor: 0.5,
                              angle: 90,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
