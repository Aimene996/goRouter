import 'package:chat/services/auth_service.dart';
import 'package:chat/views/auth/registration.dart';
import 'package:chat/views/screens/home.dart';
import 'package:flutter/material.dart';

import '../widgets/widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthService authService = AuthService();
  bool _isLogin = false;
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "ChatApp",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'login to chat with every one',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                const Image(image: AssetImage('assets/login.png')),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  decoration: textInputDecoration.copyWith(
                      labelText: 'Enter a email',
                      prefixIcon: const Icon(Icons.email)),
                  validator: (val) {
                    return RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val!)
                        ? null
                        : "Please enter a valid email";
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.length < 6) {
                      return "Password must be at least 6 characters";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  obscureText: true,
                  decoration: textInputDecoration.copyWith(
                      labelText: 'Enter a password',
                      prefixIcon: const Icon(Icons.lock)),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () {
                      login();
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100.0),
                  child: Row(
                    children: [
                      const Text("dont have account? "),
                      TextButton(
                          onPressed: () {
                            nextScreen(context, const Registration());
                          },
                          child: const Text(
                            "Create account",
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLogin = true;
      });
      await authService
          .loginwithEmailAndPassword(email, password)
          .then((value) async {
        if (value == true) {
          nextScreenReplace(context, const Home());
        }
      });
    } else {
      setState(() {
        _isLogin = false;
      });
    }
    ;
  }
}
