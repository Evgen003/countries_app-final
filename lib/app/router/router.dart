import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:countries_app/app/app.dart';
import 'package:countries_app/di/di.dart';

final GlobalKey<NavigatorState> _rootNavigationKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  observers: [TalkerRouteObserver(talker)],
  initialLocation: '/auth',
  navigatorKey: _rootNavigationKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/auth',
      pageBuilder: (context, state) {
        return NoTransitionPage<void>(
          key: state.pageKey,
          child: const AuthScreen(),
        );
      },
    ),
    GoRoute(
      path: '/registration',
      pageBuilder: (context, state) {
        return NoTransitionPage<void>(
          key: state.pageKey,
          child: const RegScreen(),
        );
      },
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) {
        return NoTransitionPage<void>(
          key: state.pageKey,
          child: const HomeScreen(),
        );
      },
      routes: [
        GoRoute(
          path: 'article/:id',
          pageBuilder: (context, state) {
            return NoTransitionPage<void>(
              key: state.pageKey,
              child: const DetailsScreen(),
            );
          },
        ),
        GoRoute(
          path: 'favourites',
          pageBuilder: (context, state) {
            return NoTransitionPage<void>(
              key: state.pageKey,
              child: const FavouritesScreen(),
            );
          },
        ),
      ],
    ),
  ],
);
