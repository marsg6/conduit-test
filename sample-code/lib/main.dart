import 'dart:async';

import 'package:assignment/core/route/router.dart';
import 'package:assignment/core/theme/scroll.dart';
import 'package:assignment/core/utility/local_storage/manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await AppInitializer.initialize();

      runApp(
        const ProviderScope(
          child: App(),
        ),
      );
    },
    (exception, stackTrace) {},
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: '모 회사 Assignment',
      routerConfig: ref.watch(routerProvider),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              padding: EdgeInsets.zero,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            padding: const EdgeInsets.all(10.0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: DefaultTextHeightBehavior(
            textHeightBehavior: const TextHeightBehavior(
              applyHeightToFirstAscent: false,
              applyHeightToLastDescent: false,
            ),
            child: ScrollConfiguration(
              behavior: CustomScrollBehavior(),
              child: child!,
            ),
          ),
        );
      },
    );
  }
}

class AppInitializer {
  const AppInitializer._();

  static Future<void> initialize() async {
    await LocalStorageManager.initialize();
  }
}
