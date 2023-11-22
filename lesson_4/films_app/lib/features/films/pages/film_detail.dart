import 'package:films_app/app/models/film_card_model.dart';
import 'package:flutter/material.dart';

class FilmDetailArguments {
  final FilmCardModel model;

  FilmDetailArguments(
    this.model,
  );
}

class FilmDetail extends StatelessWidget {
  final FilmDetailArguments arguments;
  static const path = '/film-detail';

  const FilmDetail({
    super.key,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film detail'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                arguments.model.picture,
                fit: BoxFit.cover,
                height: 550,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      arguments.model.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              right: 8,
                            ),
                            child: Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                          ),
                          Text(
                            arguments.model.voteAverage.toStringAsFixed(1),
                            style: TextStyle(
                              fontSize: 16,
                              color: arguments.model.voteAverage < 4
                                  ? Colors.red
                                  : arguments.model.voteAverage >= 8
                                      ? Colors.green
                                      : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        bottom: 16,
                      ),
                      child: Text(
                        'Дата выхода: ${arguments.model.releaseDate}',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Text(
                      arguments.model.description,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
