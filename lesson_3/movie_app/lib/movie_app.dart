import 'package:flutter/material.dart';
import 'package:movie_app/screens/home_screen.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
