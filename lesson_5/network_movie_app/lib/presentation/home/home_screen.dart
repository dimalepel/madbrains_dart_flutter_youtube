import 'package:flutter/material.dart';
import 'package:network_movie_app/data/repositories/movies_repository.dart';
import 'package:network_movie_app/domain/models/home_model.dart';

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
                ? Center(
                    child: Text('OK'),
                  )
                : Center(
                    child: Text('Loading'),
                  );
          },
        ),
      ),
    );
  }
}
