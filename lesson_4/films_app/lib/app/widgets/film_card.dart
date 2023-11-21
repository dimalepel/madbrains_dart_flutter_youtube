import 'package:films_app/app/widgets/buttons/primary_button.dart';
import 'package:films_app/app/widgets/rating_chip.dart';
import 'package:flutter/material.dart';

import '../models/film_card_model.dart';

class FilmCard extends StatelessWidget {
  final int id;
  final String title;
  final String picture;
  final double voteAverage;

  const FilmCard({
    super.key,
    required this.id,
    required this.title,
    required this.picture,
    required this.voteAverage,
  });

  factory FilmCard.fromModel({
    required FilmCardModel model,
  }) {
    return FilmCard(
      id: model.id,
      title: model.title,
      picture: model.picture,
      voteAverage: model.voteAverage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            offset: Offset(1, 2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                picture,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 4,
            top: 4,
            child: RatingChip(
              voteAverage: voteAverage,
            ),
          ),
          Positioned(
            left: 8,
            bottom: 8,
            right: 8,
            child: PrimaryButton(
              title: 'More',
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
