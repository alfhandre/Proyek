import 'package:bisalogin/login.dart';
import 'package:bisalogin/mainmenu.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(Andre());
}

class Andre extends StatelessWidget {
  const Andre({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MainMenu(),
      ),
    );
  }
}
