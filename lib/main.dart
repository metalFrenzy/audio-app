import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import './screens/home_screen.dart';
import 'generated/l10n.dart';
import './providers/settings_provider.dart';
import './providers/audio_provider.dart';
import './theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AudioProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingsProvider(),
          builder: (context, child) {
            final settings = Provider.of<SettingsProvider>(context);
            return MaterialApp(
              darkTheme: darkmode,
              locale: settings.locale,
              title: 'Flutter Demo',
              theme: settings.themeData,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              home: const HomeScreen(),
            );
          },
        ),
      ],
    );
  }
}
