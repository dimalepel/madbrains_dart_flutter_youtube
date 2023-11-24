import 'package:flutter/material.dart';
import 'package:network_movie_app/components/widgets/primary_button.dart';
import 'package:network_movie_app/components/widgets/rating_chip.dart';
import 'package:network_movie_app/domain/models/movie_card_model.dart';

class MovieCard extends StatefulWidget {
  final MovieCardModel? movieCardModel;

  const MovieCard({
    super.key,
    this.movieCardModel,
  });

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
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
              child: Image.network(
                widget.movieCardModel!.picture!,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
          Positioned(
            right: 4,
            top: 4,
            child: RatingChip(
              voteAverage: widget.movieCardModel!.voteAverage!,
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
                widget.movieCardModel!.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Colors.white,
                  fontSize: 28,
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
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
