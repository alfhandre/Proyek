import 'dart:ui';
import 'package:calendar_view/calendar_view.dart';

import 'pages/login_page.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Eventing',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: EventListView(),
        routes: {
          'register': (context) => RegisterPage(),
          'login': (context) => const LoginPage(),
        });
  }
}
