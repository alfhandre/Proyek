import 'package:bisalogin/main.dart';
import 'package:bisalogin/mainmenu.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class percobaanlogin extends StatefulWidget {
  const percobaanlogin({super.key});

  @override
  State<percobaanlogin> createState() => _percobaanloginState();
}

class _percobaanloginState extends State<percobaanlogin> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email tidak boleh kosong';
                }
                return null;
              },
              onSaved: (value) {
                _email = value!;
              },
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password tidak boleh kosong';
                }
                return null;
              },
              onSaved: (value) {
                _password = value!;
              },
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // validasi berhasil, lanjutkan login
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // lakukan proses login, contoh:
    if (_email == 'andre' && _password == '123') {
      prefs.setString('email', _email);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainMenu()),
      );
    } else {
      // login gagal, tampilkan pesan error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Email atau password salah'),
      ));
    }
  }
}
