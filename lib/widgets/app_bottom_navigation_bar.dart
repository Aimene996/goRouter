import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({Key? key}) : super(key: key);
  int calculateIndex(BuildContext ctx) {
    final String location = GoRouterState.of(ctx).location;
    if (location.startsWith("/home")) {
      return 0;
    }

    if (location.startsWith("/store")) {
      return 1;
    }

    if (location.startsWith("/profile")) {
      return 2;
    }

    if (location.startsWith("/settings")) {
      return 3;
    }

    return 0;
  }

  void onTab(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/home');
        break;
      case 1:
        GoRouter.of(context).go('/store');
        break;
      case 2:
        GoRouter.of(context).go('/profile');
        break;
      case 3:
        GoRouter.of(context).go('/settings');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: calculateIndex(context),
      onTap: (value) => onTab(value, context),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.store),
          label: "Store",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey.shade800,
    );
  }
}
