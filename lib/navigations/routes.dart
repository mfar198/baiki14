import 'dart:ui';
import 'package:baiki/ui/register.dart';
import 'package:baiki/ui/searchShop.dart';
import 'package:baiki/ui/testlogin.dart';
import 'package:baiki/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:baiki/header/appBar.dart';
import 'package:baiki/main.dart';

class NavigationRoutes {
  static final routes = <RouteBase>[
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const MyHomePage(
            key: ValueKey('home'),
            title: 'Home',
          ),
        );
      },
    ),
    GoRoute(path: '/home/register',
      pageBuilder: (context, state){
        return MaterialPage(
            key: state.pageKey,
            child: const regPage(
              key: ValueKey('register'),
            )
        );
      },
    ),
    GoRoute(path: '/baiki/search',
      pageBuilder: (context, state){
        return MaterialPage(
            key: state.pageKey,
            child: searchPage(
              key: ValueKey('search'),
            )
        );
      },
    ),
  ];
  static final GoRouter router = GoRouter(
    routes: routes,
    initialLocation: '/home',
  );
}