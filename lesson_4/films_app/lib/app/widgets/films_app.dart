import 'package:films_app/features/films/pages/home_page.dart';
import 'package:flutter/material.dart';

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
      home: const HomePage(
        title: 'Films App',
      ),
    );
  }
}
