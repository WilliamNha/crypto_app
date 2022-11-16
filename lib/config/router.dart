import 'package:crypto_tracker_app/core/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:crypto_tracker_app/core/splash/screnn/splash_screen.dart';
import 'package:crypto_tracker_app/modules/home/screen/home_screen.dart';
import 'package:crypto_tracker_app/modules/on_boarding/screen/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/on_boarding',
      builder: (BuildContext context, GoRouterState state) {
        return const OnBoardingScreen();
      },
    ),
    GoRoute(
      path: '/navigation_bar',
      builder: (BuildContext context, GoRouterState state) {
        return const BottomNavigationBarScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
  ],
);
