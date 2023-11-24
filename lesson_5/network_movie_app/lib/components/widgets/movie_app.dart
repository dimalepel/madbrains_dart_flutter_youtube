import 'package:flutter/material.dart';

import '../../presentation/home/home_screen.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter movie',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
