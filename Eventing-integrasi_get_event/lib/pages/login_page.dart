import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                hintText: 'Enter Email',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)))),
          ),
          const SizedBox(
            height: 8.0,
          ),
          const TextField(
            textAlign: TextAlign.center,
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'Enter Password',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Material(
              elevation: 5.0,
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'home');
                },
                minWidth: 200.0,
                height: 42.0,
                child: const Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          InkWell(
              child:
                  const Text('Register', style: TextStyle(color: Colors.blue)),
              onTap: () {
                Navigator.pushNamed(context, 'register');
              })
        ],
      ),
    );
  }
}
