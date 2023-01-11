import 'package:chat/screens/home.dart';
import 'package:chat/screens/profile.dart';
import 'package:chat/screens/settings.dart';
import 'package:chat/screens/store.dart';
import 'package:chat/widgets/root_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

GoRouter rootRouter = GoRouter(
  initialLocation: '/home',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return RootBottomNavigation(child: child);
      },
      routes: [
        GoRoute(
          path: "/home",
          builder: (context, state) => const Home(),
        ),
        GoRoute(
          path: "/store",
          builder: (context, state) => Store(),
        ),
        GoRoute(
          path: "/settings",
          builder: (context, state) => const Settings(),
        ),
        GoRoute(
          path: "/profile",
          builder: (context, state) => const Profile(),
        ),
      ],
    )
  ],
);
