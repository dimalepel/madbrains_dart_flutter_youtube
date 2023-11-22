import 'package:films_app/app/widgets/buttons/primary_button.dart';
import 'package:films_app/app/widgets/rating_chip.dart';
import 'package:films_app/features/films/pages/film_detail.dart';
import 'package:flutter/material.dart';

import '../models/film_card_model.dart';

class FilmCard extends StatefulWidget {
  final int id;
  final String title;
  final String picture;
  final double voteAverage;
  final String releaseDate;
  final String description;

  const FilmCard({
    super.key,
    required this.id,
    required this.title,
    required this.picture,
    required this.voteAverage,
    this.releaseDate = '',
    this.description = '',
  });

  factory FilmCard.fromModel({
    required FilmCardModel model,
  }) {
    return FilmCard(
      id: model.id,
      title: model.title,
      picture: model.picture,
      voteAverage: model.voteAverage,
      releaseDate: model.releaseDate,
      description: model.description,
    );
  }

  @override
  State<FilmCard> createState() => _FilmCardState();
}

class _FilmCardState extends State<FilmCard> {
  bool _isFavorite = false;

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
                widget.picture,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 4,
            top: 4,
            child: RatingChip(
              voteAverage: widget.voteAverage,
            ),
          ),
          Positioned(
            left: 4,
            top: 4,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).primaryColor,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                color: _isFavorite ? Colors.red : Colors.white,
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                },
                icon: const Icon(
                  Icons.favorite,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Colors.white,
                  fontSize: 32,
                  shadows: [
                    const Shadow(
                      offset: Offset(1, 2),
                      blurRadius: 5.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 8,
            bottom: 8,
            right: 8,
            child: PrimaryButton(
              title: 'More',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/film-detail',
                  arguments: FilmDetailArguments(
                    FilmCardModel(
                      id: widget.id,
                      title: widget.title,
                      picture: widget.picture,
                      voteAverage: widget.voteAverage,
                      releaseDate: widget.releaseDate,
                      description: widget.description,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
