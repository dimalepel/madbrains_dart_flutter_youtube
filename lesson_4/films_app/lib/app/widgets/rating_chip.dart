import 'package:flutter/material.dart';

class RatingChip extends StatelessWidget {
  final double voteAverage;

  const RatingChip({
    super.key,
    required this.voteAverage,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: const Icon(
        Icons.star,
        color: Colors.yellow,
      ),
      label: Text(
        voteAverage.toStringAsFixed(1),
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Colors.white,
            ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
