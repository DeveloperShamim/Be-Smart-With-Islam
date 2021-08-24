import 'package:al_quran/data/location.dart';
import 'package:al_quran/data/themes.dart';
import 'package:al_quran/data/uistate.dart';
import 'package:al_quran/ui/about.dart';
import 'package:al_quran/ui/compass.dart';
import 'package:al_quran/ui/home.dart';
import 'package:al_quran/ui/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => UiState()),
      ChangeNotifierProvider(create: (_) => ThemeNotifier()),
      ChangeNotifierProvider(create: (_) => LocationNotifier()),
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Be Smart With Islam',
      theme: Provider.of<ThemeNotifier>(context).curretThemeData,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/settings': (context) => Settings(),
        '/about': (context) => About(),
        '/kiblah': (context) => Compass(),
      },
    );
  }
}
