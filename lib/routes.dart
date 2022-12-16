import 'package:demo_screens/screens/Dashboard.dart';
import 'package:demo_screens/screens/LoginScreen.dart';
import 'package:demo_screens/screens/Settings.dart';
import 'package:demo_screens/screens/SignUp.dart';

import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (BuildContext context) => LoginScreen(),
  Dashboard.routeName: (BuildContext context) => Dashboard(),
  Settings.routeName: (BuildContext context) => Settings(),
  SignUp.routeName: (BuildContext context) => SignUp(),
};
