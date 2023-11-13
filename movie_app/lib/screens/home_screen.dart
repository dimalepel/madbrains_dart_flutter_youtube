import 'package:flutter/material.dart';
import 'package:movie_app/utils/utils.dart';

import '../models/movie.dart';
import '../widgets/movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Movie> movies;

  Future<void> _fetchData() async {
    var result = await getMovies();

    setState(() {
      movies = result;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    print(movies);
    return Scaffold(
      backgroundColor: Color(0xff09090C),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              // for (Movie movie in movies) ...[
              //   MovieCard(
              //     title: movie.title,
              //     picture: movie.picture,
              //     language: movie.language,
              //   )
              // ],
            ],
          ),
        ),
      ),
    );
  }
}
