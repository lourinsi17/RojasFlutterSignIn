import 'package:demo_screens/screens/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  static String routeName = "/dashboard";

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Settings.routeName);
            },
            child: Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.settings,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Text("Dashboard"),
      ),
    );
  }
}
