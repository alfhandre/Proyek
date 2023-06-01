import 'package:eventing/formregister.dart';
import 'package:eventing/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class formlogin extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  child: Center(
                    child: Image.asset(
                      'images/logo.png',
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),

                //form username
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    // controller: nameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                ),

                //form password
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    // controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        //forgot password screen
                      },
                      child: const Text(
                        'Forgot Password',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return formregister();
                        }));
                      },
                      child: const Text(
                        'Register',
                      ),
                    ),
                  ],
                ),

                //login button
                Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // validasi berhasil, lanjutkan login
                      }
                      _login();
                    },
                  ),
                )
              ],
            ),
          ),
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

  // method ini berfungsi untuk memasukkan data ke dalam SharedPreferences
  // void setIntoSharedPreferences() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   await prefs.setString("email", emailController.text);
  //   await prefs.setString("password", passwordController.text);
  // }

  // // Method ini berfungsi untuk mengambil data Email dan Password dari SharedPreferences
  // // kemudian dimasukkan ke variable email dan password
  // void getFromSharedPreferences() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   setState(
  //     () {
  //       email = prefs.getString("email")!;
  //       password = prefs.getString("password")!;
  //       Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(
  //           builder: (context) {
  //             return MainMenu();
  //           },
  //         ),
  //       );
  //     },
  //   );
}
