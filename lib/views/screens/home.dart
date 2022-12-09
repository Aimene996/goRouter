import 'package:chat/services/auth_service.dart';
import 'package:chat/views/auth/login.dart';
import 'package:chat/views/widgets/widget.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Scaffold(
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                authService.signOut();
                nextScreenReplace(context, const Login());
              },
              child: Text("sign out ")),
        ),
      ),
    );
  }
}
