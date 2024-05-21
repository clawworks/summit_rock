import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// ignore:depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/firebase_options.dart';
import 'package:summit_rock/src/summit_rock_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Turns off the # in the URLs on web
  usePathUrlStrategy();

  // Ensures URL changes in address bar when using push or pushNamed
  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(const ProviderScope(child: SummitRockApp()));
}
