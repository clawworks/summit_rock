import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/src/features/settings/domain/summit_rock_year.dart';
import 'package:summit_rock/src/routing/app_router.dart';

class SummitRockApp extends ConsumerWidget {
  const SummitRockApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final year = ref.watch(yearSelectionProvider);
    final is2025 = year == SummitRockYear.twentyFive;
    return MaterialApp.router(
      title: 'Summit Rock',
      routerConfig: ref.watch(goRouterProvider),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: is2025
            ? ColorScheme.fromSeed(
                seedColor: Colors.blueAccent,
                dynamicSchemeVariant: DynamicSchemeVariant.vibrant)
            : ColorScheme.fromSeed(
                seedColor: Colors.green,
                dynamicSchemeVariant: DynamicSchemeVariant.vibrant),
        useMaterial3: true,
      ),
    );
  }
}
