// import 'dart:io';

// import 'package:flutter/material.dart';

// class AdminReportList extends StatefulWidget {
//   @override
//   _AdminReportListState createState() => _AdminReportListState();
// }

// class _AdminReportListState extends State<AdminReportList> {
//   List<Report> _reports = [];

//   void _addReport(Report report) {
//     setState(() {
//       _reports.add(report);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Submitted Reports')),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _reports.length,
//               itemBuilder: (context, index) {
//                 final report = _reports[index];
//                 return ListTile(
//                   title: Text(report.bridgeName),
//                   subtitle: Text(report.location),
//                   trailing: Text(report.description),
//                   onTap: () {
//                     // Handle on tap (e.g., show details)
//                     showDialog(
//                       context: context,
//                       builder: (context) => AlertDialog(
//                         title: Text(report.bridgeName),
//                         content: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text('Location: ${report.location}'),
//                             Text('Description: ${report.description}'),
//                             report.imagePath != 'No image selected'
//                                 ? Image.file(File(report.imagePath))
//                                 : Text('No image available'),
//                           ],
//                         ),
//                         actions: [
//                           TextButton(
//                             onPressed: () => Navigator.of(context).pop(),
//                             child: Text('Close'),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => BridgeDetailForm(onReportSubmitted: _addReport),
//                   ),
//                 );
//               },
//               child: Text('Add New Report'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hell_o/app/constans/app_constants.dart';

// Constants

// Dummy Data for Reports
class Report {
  final String title;
  final String workerName;
  final String submissionDate;
  final String status;

  Report({
    required this.title,
    required this.workerName,
    required this.submissionDate,
    required this.status,
  });
}

final List<Report> dummyReports = [
  Report(
      title: 'Bridge Inspection Report',
      workerName: 'Manthan Parsekar',
      submissionDate: 'Oct 1, 2024',
      status: 'Pending'),
  Report(
      title: 'Road Maintenance Report',
      workerName: 'Jane Smith',
      submissionDate: 'Sept 30, 2024',
      status: 'Reviewed'),
  Report(
      title: 'Safety Check Report',
      workerName: 'Chris Johnson',
      submissionDate: 'Sept 29, 2024',
      status: 'Approved'),
];

class AdminReportPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Report Panel'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Submitted Reports',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: dummyReports.length,
                itemBuilder: (context, index) {
                  final report = dummyReports[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.grey[900],
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            report.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: kFontColorPallets[0], // White
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Submitted by: ${report.workerName}',
                            style: TextStyle(
                              color: kFontColorPallets[1], // Light Gray
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Submission Date: ${report.submissionDate}',
                            style: TextStyle(
                              color: kFontColorPallets[2], // Darker Gray
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Chip(
                                label: Text(
                                  report.status,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                backgroundColor: _getStatusColor(report.status),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  // Show report details or actions
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black87,
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return Colors.orange;
      case 'Reviewed':
        return Colors.blue;
      case 'Approved':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
