import 'package:flutter/material.dart';

import '../../../app/models/film_card_model.dart';
import '../../../app/widgets/film_card.dart';

class FilmGrid extends StatelessWidget {
  final List<FilmCardModel> films;

  const FilmGrid({
    super.key,
    required this.films,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: FilmCard.fromModel(model: films[index % films.length]),
        );
      },
    );
  }
}
