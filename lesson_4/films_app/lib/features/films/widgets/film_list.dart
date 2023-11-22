import 'package:flutter/material.dart';

import '../../../app/models/film_card_model.dart';
import '../../../app/widgets/film_tile.dart';

class FilmList extends StatelessWidget {
  final List<FilmCardModel> films;

  const FilmList({
    super.key,
    required this.films,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return FilmTile.fromModel(model: films[index % films.length]);
      },
    );
  }
}
