// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// class WorkerDashboard extends StatefulWidget {
//   @override
//   _WorkerDashboardState createState() => _WorkerDashboardState();
// }

// class _WorkerDashboardState extends State<WorkerDashboard> {
//   List<Map<String, dynamic>> tasks = [
//     {
//       "taskName": "Inspect Power Lines",
//       "dueDate": "Due in 2 days",
//       "status": "Pending",
//       "assignedTo": "John Doe",
//     },
//     {
//       "taskName": "Check Transformer",
//       "dueDate": "Late by 1 day",
//       "status": "In Progress",
//       "assignedTo": "Samantha Green",
//     },
//     {
//       "taskName": "Inspect Solar Panels",
//       "dueDate": "Due today",
//       "status": "Completed",
//       "assignedTo": "Chris Fox",
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF1B1B1D), // Dark theme background color
//       appBar: AppBar(
//         backgroundColor: Color(0xFF1B1B1D),
//         elevation: 0,
//         title: Text(
//           "Worker Dashboard",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 24,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildPendingTaskCard(), // Card to show pending tasks summary
//             SizedBox(height: 20.0),
//             Text(
//               "Assigned Tasks",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10.0),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: tasks.length,
//                 itemBuilder: (context, index) {
//                   return _buildTaskCard(tasks[index]);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPendingTaskCard() {
//     return Container(
//       padding: EdgeInsets.all(20.0),
//       decoration: BoxDecoration(
//         color: Color(0xFF252525),
//         borderRadius: BorderRadius.circular(kBorderRadius),
//       ),
//       child: Row(
//         children: [
//           Icon(Icons.warning, color: Colors.yellow, size: 30),
//           SizedBox(width: 10.0),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "You have 3 pending tasks",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 5.0),
//               Text(
//                 "Check your assigned tasks and complete them",
//                 style: TextStyle(
//                   color: Colors.white70,
//                   fontSize: 16.0,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTaskCard(Map<String, dynamic> task) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 20.0),
//       padding: EdgeInsets.all(20.0),
//       decoration: BoxDecoration(
//         color: Color(0xFF252525),
//         borderRadius: BorderRadius.circular(kBorderRadius),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 task['taskName'],
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
//                 decoration: BoxDecoration(
//                   color: task['status'] == 'Pending'
//                       ? Colors.red
//                       : task['status'] == 'In Progress'
//                           ? Colors.orange
//                           : Colors.green,
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: Text(
//                   task['status'],
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 10.0),
//           Text(
//             task['dueDate'],
//             style: TextStyle(
//               color: Colors.white70,
//               fontSize: 16.0,
//             ),
//           ),
//           SizedBox(height: 10.0),
//           Row(
//             children: [
//               Icon(Icons.person, color: Colors.white70, size: 20),
//               SizedBox(width: 5.0),
//               Text(
//                 "Assigned to: ${task['assignedTo']}",
//                 style: TextStyle(color: Colors.white70, fontSize: 16.0),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
