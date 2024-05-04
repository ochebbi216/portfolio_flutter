import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:omarchebbi/pages/SplashScreen.page.dart';
import 'package:omarchebbi/pages/certifications.page.dart';
import 'package:omarchebbi/pages/codeQR.page.dart';
import 'package:omarchebbi/pages/competences.page.dart';
import 'package:omarchebbi/pages/experience_professionnelles.page.dart';
import 'package:omarchebbi/pages/formation_academique.page.dart';
import 'package:omarchebbi/pages/home.page.dart';
import 'package:omarchebbi/pages/informations_personnells.page.dart';
import 'package:omarchebbi/pages/interets.page.dart';
import 'package:omarchebbi/pages/langues.page.dart';
import 'package:omarchebbi/pages/projets_academiques.page.dart';

import 'langue/langue_app.dart'; // Ensure correct path

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system; // Start with the system theme

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool isOn) {
    _themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void setSystemThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}

void main() {
  WebView.platform = SurfaceAndroidWebView();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AppLanguage()),
          ChangeNotifierProvider(create: (context) => ThemeManager()),
        ],
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
      builder: (context, themeManager, child) {
        return MaterialApp(
          routes: {
            '/competences': (context) => Competences(),
            '/formation_academique': (context) => Formation_Academique(),
            '/informations_personnells': (context) => InformationsPersonnelles(),
            '/experience_professionnelles': (context) => ExperienceProfessionnelles(),
            '/projets_academiques': (context) => Projets_academiques(),
            '/certifications': (context) => Certification(),
            '/home': (context) => Home(),
            '/langues': (context) => Langues(),
            '/interets': (context) => Interets(),
            '/codeQR': (context) => CodeQR(),
          },
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.deepPurple,
            cardColor: Colors.deepPurple[800],
            appBarTheme: AppBarTheme(
              color: Colors.deepPurple[900],
            ),
            textTheme: TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              titleLarge: TextStyle(color: Colors.white),
            ),
          ),
          themeMode: themeManager.themeMode,
          home: const SplashScreen(),
        );
      },
    );
  }
}
