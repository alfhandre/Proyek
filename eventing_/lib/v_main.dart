import 'package:eventing_/views/v_formlogin.dart';
import 'package:flutter/material.dart';
import 'package:eventing_/views/DemoApp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: formlogin(),
    );
  }
}
