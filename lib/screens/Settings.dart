import 'package:demo_screens/screens/LoginScreen.dart';
import 'package:demo_screens/services/AuthService.dart';
import 'package:demo_screens/services/StorageService.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Settings extends StatefulWidget {
  static String routeName = "/settings";

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  StorageService _storageService = StorageService();
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () async {
              await _authService.logout();
              _storageService.deleteAllData();
              Navigator.of(context).pushNamedAndRemoveUntil(
                LoginScreen.routeName,
                (Route<dynamic> route) => false,
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.logout,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: const Center(
        child: Text("Settings"),
      ),
    );
  }
}
