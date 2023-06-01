import 'package:flutter/material.dart';
import 'package:scannerqr/main.dart';
import 'package:scannerqr/scanner.dart';
import './home.dart';
import './main.dart';
import './scanner.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 113, 8, 99),
        title: Text('Waroenk Satria'),
      ),
      body: Center(
        child: Text(
          _result != '' ? _result : 'Selamat Datang di Waroenk Satria',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        // child: Icon(Icons.center_focus_strong),
        onPressed: () => _openScanner(context),
        child: IconButton(
            onPressed: () => _openScanner(context),
            icon: Icon(Icons.center_focus_strong),
            color: Colors.white),
      ),
    );
  }

  // void _openScanner() {
  //   Navigator.push(context, MaterialPageRoute(
  //     builder: (c) {
  //       return Scanner();
  //     },
  //   ));
  // }

  Future _openScanner(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (c) => Scanner(),
        ));
    setState(() {
      _result = result;
    });
  }

}
