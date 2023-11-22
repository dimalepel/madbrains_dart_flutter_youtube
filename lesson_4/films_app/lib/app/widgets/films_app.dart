import 'package:films_app/features/films/pages/film_detail.dart';
import 'package:films_app/features/settings/pages/settings_page.dart';
import 'package:flutter/material.dart';

import 'main_page.dart';

class FilmsApp extends StatelessWidget {
  const FilmsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Films App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: MainPage.path,
      onGenerateRoute: (settings) {
        if (settings.name == MainPage.path) {
          return MaterialPageRoute(builder: (context) {
            return const MainPage();
          });
        }

        if (settings.name == SettingsPage.path) {
          final SettingsArguments arguments =
              settings.arguments as SettingsArguments;

          return MaterialPageRoute(builder: (context) {
            return SettingsPage(
              arguments: arguments,
            );
          });
        }

        if (settings.name == FilmDetail.path) {
          final FilmDetailArguments arguments =
              settings.arguments as FilmDetailArguments;

          return MaterialPageRoute(builder: (context) {
            return FilmDetail(
              arguments: arguments,
            );
          });
        }

        return null;
      },
    );
  }
}
