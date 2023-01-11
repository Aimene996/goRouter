import 'package:flutter/material.dart';

import 'app_bottom_navigation_bar.dart';

class RootBottomNavigation extends StatelessWidget {
  const RootBottomNavigation({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat app')),
      body: child,
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
    ;
  }
}
