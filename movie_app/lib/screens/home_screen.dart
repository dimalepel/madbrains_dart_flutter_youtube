import 'package:flutter/material.dart';

import '../widgets/movie_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff09090C),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              MovieCard(
                title: 'Мое прекрассное несчастье',
                picture: 'assets/images/pic--poster-01.jpg',
                language: 'Русский',
              ),
              MovieCard(
                title: 'Мое прекрассное несчастье',
                picture: 'assets/images/pic--poster-02.jpg',
                language: 'Русский',
              ),
              MovieCard(
                title: 'Мое прекрассное несчастье',
                picture: 'assets/images/pic--poster-03.jpg',
                language: 'Русский',
              )
            ],
          ),
        ),
      ),
    );
  }
}
