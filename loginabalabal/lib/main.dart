import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyHomePage());
}

class andre extends StatelessWidget {
  const andre({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State {
  String email = "";
  String password = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Shared Preferences')),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          // input email
          TextField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)))),

          Padding(padding: EdgeInsets.only(top: 4)),

          // input password
          TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)))),

          // button untuk menyimpan email dan password ke dalam Shared Preferences melalui method
          // setIntoSharedPreferences()
          ElevatedButton(
            child: Text("Set"),
            onPressed: () {
              setIntoSharedPreferences();
            },
          ),

          Padding(padding: EdgeInsets.only(top: 8)),

          // Menampilkan Email pada Text Widget
          Text(
            "Your Email : $email",
            style: TextStyle(fontSize: 20),
          ),

          // Menampilkan password pada Text Widget
          Text(
            "Your Password : $password",
            style: TextStyle(fontSize: 20),
          ),

          // Button yang berfungsi memanggil method getFromSharedPreferences() untuk menampilkan
          // Email dan Password pada Text Widget
          ElevatedButton(
            child: Text("Get"),
            onPressed: () {
              getFromSharedPreferences();
            },
          ),
        ],
      ),
    );
  }

  // method ini berfungsi untuk memasukkan data ke dalam SharedPreferences
  void setIntoSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("email", emailController.text);
    await prefs.setString("password", passwordController.text);
  }

  // Method ini berfungsi untuk mengambil data Email dan Password dari SharedPreferences
  // kemudian dimasukkan ke variable email dan password
  void getFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      email = prefs.getString("email")?.toString() ?? '';
      password = prefs.getString("password")?.toString() ?? '';
    });
  }
}
