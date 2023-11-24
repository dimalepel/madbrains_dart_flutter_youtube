import 'package:flutter/material.dart';
import 'package:network_movie_app/data/repositories/movies_repository.dart';
import 'package:network_movie_app/domain/models/home_model.dart';

import '../../components/widgets/movie_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<HomeModel?>(
          future: MoviesRepository.loadData(),
          builder: (context, data) {
            return data.hasData
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                    ),
                    itemBuilder: (context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: MovieCard(
                          movieCardModel: data.data?.results![index],
                          key: ValueKey<int>(
                              data.data?.results![index].id ?? -1),
                        ),
                      );
                    },
                    itemCount: data.data?.results?.length ?? 0,
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
