import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hell_o/app/constans/app_constants.dart';
// Import your constants

class ViewLineChart extends StatefulWidget {
  const ViewLineChart({Key? key}) : super(key: key);

  @override
  _ViewLineChartState createState() => _ViewLineChartState();
}

class _ViewLineChartState extends State<ViewLineChart> {
  List<Color> gradientColors = [
    primaryColor,
    secondaryColor,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        appPadding,
        appPadding * 1.5,
        appPadding,
        appPadding,
      ),
      child: LineChart(LineChartData(
          gridData: FlGridData(
            show: false,
          ),
          titlesData: FlTitlesData(
              show: true,
              // topTitles: : ,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 22,
                  // getTextStyles: (value) => TextStyle(
                  //   color: lightTextColor,
                  //   fontWeight: FontWeight.bold,
                  //   fontSize: 14,
                  // ),
                  getTitlesWidget: (value, meta) {
                    Widget text;
                    switch (value.toInt()) {
                      case 1:
                        text = const Text('Sun');
                        break;
                      case 4:
                        text = const Text('Mon');
                        break;
                      case 7:
                        text = const Text('Tue');
                        break;
                      case 10:
                        text = const Text('Wed');
                        break;
                      case 13:
                        text = const Text('Thu');
                        break;
                      case 16:
                        text = const Text('Fri');
                        break;
                      case 19:
                        text = const Text('Sat');
                        break;
                      default:
                        text = const Text('');
                        break;
                    }
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: text,
                    );
                  },
                ),
              )),
          borderData: FlBorderData(
            show: false,
          ),
          minX: 0,
          maxX: 20,
          maxY: 6,
          minY: 0,
          lineBarsData: [
            LineChartBarData(
                spots: [
                  const FlSpot(0, 3),
                  const FlSpot(4, 2),
                  const FlSpot(9, 4),
                  const FlSpot(12, 3),
                  const FlSpot(15, 5),
                  const FlSpot(18, 3),
                  const FlSpot(20, 4),
                ],
                isCurved: true,
                color: primaryColor,
                barWidth: 5,
                isStrokeCapRound: true,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors:
                        gradientColors.map((e) => e.withOpacity(0.3)).toList(),
                    begin: const Alignment(0, 0),
                    end: const Alignment(0, 1.75),
                  ),
                ))
          ])),
    );
  }
}
