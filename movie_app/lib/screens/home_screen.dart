import 'package:flutter/material.dart';
import 'package:movie_app/utils/utils.dart';
import 'package:flutter/services.dart';

import '../models/movie.dart';
import '../widgets/movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Movie> movies = [];
  Language? _currentLang = Language.russian;
  bool _isSubscription = false;
  int _rating = 0;

  final TextEditingController ratingController = TextEditingController();

  Future<void> _fetchData() async {
    var result = await getMovies();

    setState(() {
      movies = result;
    });
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  void dispose() {
    ratingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff09090C),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Киношка',
        ),
      ),
      body: SafeArea(
        child: movies.isNotEmpty ? SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                //for (Movie movie in movies) ...[
                for (int idx = 0; idx < movies.length; idx++) ...[
                  MovieCard(
                    title: movies[idx].title,
                    picture: movies[idx].picture,
                    language: movies[idx].stringToEnum(),
                    isSubscription: movies[idx].isSubscription,
                    rating: movies[idx].voteAverage,
                    isLast: (idx == movies.length - 1) ? true : false,
                  )
                ],
              ],
            ),
          ),
        ) : const Center(
          child: Text(
            'Ничего не найдено :(',
            style: TextStyle(
                color: Color(0xffffffff),
                fontSize: 16
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: 170
          ),
          padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10
          ),
          decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8)
              )
          ),
          child: Column(
            children: [
              TextField(
                controller: ratingController,
                decoration: const InputDecoration(
                  hintText: 'Введите рейтинг фильма',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var lang in Language.values) ...[
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Radio<Language>(
                            value: lang,
                            groupValue: _currentLang,
                            onChanged: (Language? lang) {
                              setState(() {
                                _currentLang = lang;
                              });
                            },
                            activeColor: const Color(0xff000000),
                          ),
                          Expanded(
                            child: Text(lang.toPrettyString()),
                          )
                        ],
                      ),
                    ),
                  ],
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Checkbox(
                          value: _isSubscription,
                          onChanged: (bool? value) {
                            setState(() {
                              _isSubscription = !_isSubscription;
                            });
                          },
                          checkColor: const Color(0xff000000),
                        ),
                        const Expanded(
                          child: Text('Фильмы по подписке'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green
                      ),
                      onPressed: () {
                        setState(() {
                          _rating = (ratingController.text != '') ? int.parse(ratingController.text) : 0;
                          movies = filterMovie(_rating, _currentLang!, _isSubscription);
                        });
                      },
                      child: const Text('Подобрать')
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red
                      ),
                      onPressed: () {
                        setState(() {
                          _rating = 0;
                          _isSubscription = false;
                          _currentLang = Language.russian;
                          _fetchData();
                        });
                      },
                      child: const Text('Сбросить фильтр')
                    ),
                  )
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}
