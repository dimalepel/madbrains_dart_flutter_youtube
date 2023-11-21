import 'package:films_app/app/widgets/main_page.dart';
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
      home: const MainPage(),
    );
  }
}
