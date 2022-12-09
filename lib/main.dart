import 'package:chat/helper/helper.dart';
import 'package:chat/views/auth/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'views/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLogin = false;
  @override
  void initState() {
    getuserLoginStatus();
    super.initState();
  }

  getuserLoginStatus() async {
    await HelperFunction.getuserLoginStatus().then((value) => {
          if (value != null)
            {
              setState(() {
                _isLogin = value;
              })
            }
        });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: _isLogin ? const Home() : const Login(),
    );
  }
}
