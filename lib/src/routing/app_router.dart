import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/src/common_widgets/oops_page.dart';
import 'package:summit_rock/src/features/authentication/data/auth_repository.dart';
import 'package:summit_rock/src/features/authentication/presentation/sign_in_page.dart';
import 'package:summit_rock/src/features/settings/presentation/settings_page.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';
import 'package:summit_rock/src/features/word_decoder/presentation/result_page.dart';
import 'package:summit_rock/src/features/word_decoder/presentation/word_decoder_page.dart';
import 'package:summit_rock/src/routing/go_router_refresh_stream.dart';

/// All of the route names in the app.
/// Route by name like this:
/// ```dart
/// context.goNamed(AppRoute.home)
/// ```
///
/// Note that these are just the route names NOT the paths.
/// Aka, `AppRoute.home` will return `home` NOT `/home`
class AppRoute {
  static const home = 'home';
  static const signIn = 'signIn';
  static const settings = 'settings';
  static const result = 'result';
  static const oops = 'oops';
}

/// Global root Navigator key
final rootNavigatorKey = GlobalKey<NavigatorState>();

/// Provides the full GoRouter instance for the app with all supported
/// routes defined.
final goRouterProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    redirect: (context, state) async {
      final user = authRepository.currentUser;
      final isLoggedIn = user != null;
      final path = state.uri.path;
      print("In Redirect, user is ${!isLoggedIn ? "not" : ""} logged in");
      if (isLoggedIn) {
        if (path == '/signIn') {
          print("Redirecting to Home");
          return '/';
        }
        final isAdmin = await user.isAdmin();
        if (!isAdmin && path.startsWith('/admin')) {
          // Don't allow non-admin users to access admin pages
          print("Redirecting to Home");
          return '/';
        }
      } else {
        // User is NOT logged in, redirect to sign in page
        print("Redirecting to SignInPage");
        return '/${AppRoute.signIn}';
        // if (path == '/account' || path == '/orders') {
        //   return '/';
        // }
        // if (path.startsWith('/admin')) {
        //   // Don't allow non-admin users to access admin pages
        //   return '/';
        // }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.home,
        builder: (context, state) => const WordDecoderPage(),
        routes: [
          GoRoute(
            path: 'signIn',
            name: AppRoute.signIn,
            builder: (context, state) {
              return const SignInPage();
            },
            routes: [],
          ),
          GoRoute(
            path: 'settings',
            name: AppRoute.settings,
            builder: (context, state) {
              return const SettingsPage();
            },
            routes: [],
          ),
          GoRoute(
            path: 'result/:resultId',
            name: AppRoute.result,
            builder: (context, state) {
              ResultId id = state.pathParameters['resultId']!;
              return ResultPage(resultId: id);
            },
            routes: [],
          ),
          // GoRoute(
          //   path: 'drills/:drillId',
          //   name: AppRoute.drill.name,
          //   builder: (context, state) {
          //     return GetDrillPage(drillId: state.pathParameters['drillId']);
          //   },
          // ),
          GoRoute(
            path: 'oops',
            name: AppRoute.oops,
            builder: (context, state) {
              return const OopsPage();
            },
            routes: [],
          ),
          //       GoRoute(
          //         path: 'rules',
          //         pageBuilder: (context, state) {
          //           return CustomTransitionPage(
          //             fullscreenDialog: true,
          //             child: RulesPage(),
          //             transitionsBuilder: _slideUpTransition,
          //           );
          //         },
          //       ),
        ],
      ),
    ],
    errorBuilder: (context, state) {
      String currentPath = state.uri.path;
      print("Error navigating to path: $currentPath");
      return OopsPage(
        message:
            "We can't find the page you're looking for...\nThere is no page at $currentPath",
      );
    },
  );
});

SlideTransition _slideUpTransition(
    context, animation, secondaryAnimation, child) {
  const begin = Offset(0.0, 1.0);
  const end = Offset.zero;
  const curve = Curves.ease;
  final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  return SlideTransition(
    position: animation.drive(tween),
    child: child,
  );
}

FadeTransition _fadeTransition(context, animation, secondaryAnimation, child) {
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}
