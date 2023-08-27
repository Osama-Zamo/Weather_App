import 'package:flutter/material.dart';

class NoLocation extends StatelessWidget {
  const NoLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Location Disabled', style: TextStyle(fontSize: 30),),
            Text('Please enable location service', style: TextStyle(fontSize: 30),),
            Text('and restart the app', style: TextStyle(fontSize: 30),),
          ],
        ),
    );
  }
}