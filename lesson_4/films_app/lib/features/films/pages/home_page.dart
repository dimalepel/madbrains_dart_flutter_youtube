import 'package:films_app/app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../app/models/film_card_model.dart';
import '../widgets/film_list.dart';

class HomePage extends StatelessWidget {
  final String title;
  final List<FilmCardModel> films;

  const HomePage({
    super.key,
    required this.title,
    required this.films,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
      ),
      body: FilmList(
        films: films,
      ),
    );
  }
}
