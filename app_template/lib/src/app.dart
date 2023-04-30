import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/src/initializer/global_initializer.dart';
import 'package:app_template/src/services/navigation/navigation_paths.dart';
import 'package:app_template/src/services/navigation/router_builder.dart';
import 'package:app_template/src/settings/settings_providers.dart';
import 'package:template_theme/template_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalInitializer(
      child: Consumer(builder: (context, ref, _) {
        final settingsController = ref.watch(settingsControllerProvider);
        return GoRouterBuilder(
          initialLocation: Paths.initial,
          builder: (context, goRouter) {
            return AnimatedBuilder(
              animation: settingsController,
              builder: (BuildContext context, Widget? _) {
                return MaterialApp.router(
                  key: const ValueKey('routerKey'),
                  routerConfig: goRouter,
                  debugShowCheckedModeBanner: false,
                  restorationScopeId: 'app',
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [Locale('en', '')],
                  onGenerateTitle: (BuildContext context) {
                    return AppLocalizations.of(context)!.appTitle;
                  },
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  themeMode: settingsController.themeMode,
                  builder: (_, child) {
                    return child ?? const AppSplashIcon();
                  },
                );
              },
            );
          },
        );
      }),
    );
  }
}
