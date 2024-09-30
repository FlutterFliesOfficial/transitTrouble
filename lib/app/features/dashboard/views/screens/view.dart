import 'package:flutter/material.dart';

class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do Page'),
      ),
      body: Center(
        child: Text(
          'This is the To Do Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
