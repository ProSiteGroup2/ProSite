import 'package:flutter/material.dart';

class HrdDashboard extends StatefulWidget {
  const HrdDashboard({Key? key}) : super(key: key);

  @override
  State<HrdDashboard> createState() => _HrdDashboardState();
}

class _HrdDashboardState extends State<HrdDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(child: Text('Hardware Name')),
      ),
      body: Center(child: Text('Hardware dashboard')),
    );
  }
}
