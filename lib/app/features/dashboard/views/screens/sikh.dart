import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreStreamExample extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("live data")),
      body: StreamBuilder(
        stream: _firestore
            .collection('predictions')
            .snapshots(), // Real-time snapshot
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData) {
            return Center(child: Text('No Data'));
          }

          // Build a list of documents
          return ListView(
            children: snapshot.data!.docs.map((doc) {
              Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
              return ListTile(
                title: Text(data['input'][0]
                    .toString()), // Assuming each user has a 'name' field
                subtitle: Text(
                    data['code']), // Assuming each user has an 'email' field
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
