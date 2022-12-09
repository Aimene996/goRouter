import 'package:chat/helper/helper.dart';
import 'package:chat/views/auth/login.dart';
import 'package:chat/views/screens/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../services/auth_service.dart';
import '../widgets/widget.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool _isLoading = false;
  AuthService authService = AuthService();
  final formKey = GlobalKey<FormState>();
  String fullName = "";
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "ChatApp",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'create account  to chat with every one',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      const Image(image: AssetImage('assets/register.png')),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            fullName = value;
                          });
                        },
                        decoration: textInputDecoration.copyWith(
                            labelText: 'Enter a fullname',
                            prefixIcon: const Icon(Icons.person)),
                        validator: (val) {
                          if (val!.length < 6 || val.length > 12) {
                            return val.length < 6
                                ? "Password must bemore than  6 characters"
                                : 'fullname must be less than 12 caracter';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 15),
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
                        height: 15,
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
                            "Registration",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          onPressed: () {
                            registration();
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
                            const Text("Already have account ? "),
                            TextButton(
                                onPressed: () {
                                  nextScreen(context, const Login());
                                },
                                child: const Text(
                                  "Login ",
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

  void registration() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .registrationwithEmailAndPass(fullName, email, password)
          .then((value) async {
        if (value == true) {
          // saving the data on shared prefrences
          await HelperFunction.saveUserLoggedInStatus(true);
          await HelperFunction.saveEmailStatus(email);
          await HelperFunction.saveUserNameInStatus(fullName);
          nextScreenReplace(context, Home());
        } else {
          setState(() {
            _isLoading = false;
          });
          showSnackbar(context, Colors.orange, value);
        }
      });
    }
    ;
  }
}
