import 'package:flutter/material.dart';
import 'package:network_movie_app/domain/models/home_model.dart';

import '../../components/widgets/movie_card.dart';
import '../../data/repositories/movies_repository.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: FutureBuilder<HomeModel?>(
//           future: MoviesRepository.loadData(),
//           builder: (context, data) {
//             return data.hasData
//                 ? GridView.builder(
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 2 / 3,
//                     ),
//                     itemBuilder: (context, int index) {
//                       return Padding(
//                         padding: const EdgeInsets.all(8),
//                         child: MovieCard(
//                           movieCardModel: data.data?.results![index],
//                           key: ValueKey<int>(
//                               data.data?.results![index].id ?? -1),
//                         ),
//                       );
//                     },
//                     itemCount: data.data?.results?.length ?? 0,
//                   )
//                 : const Center(
//                     child: CircularProgressIndicator(),
//                   );
//           },
//         ),
//       ),
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeModel? _homeModel;
  late Future<void> _initModelData;

  Future<void> _initModel() async {
    final homeModel = await MoviesRepository.loadData();
    _homeModel = homeModel;
  }

  Future<void> _updateModel() async {
    final homeModel = await MoviesRepository.loadData();
    setState(() {
      _homeModel = homeModel;
    });
  }

  @override
  void initState() {
    super.initState();
    _initModelData = _initModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: _initModelData,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              case ConnectionState.done:
                {
                  return RefreshIndicator(
                    onRefresh: _updateModel,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 3,
                      ),
                      itemBuilder: (context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: MovieCard(
                            movieCardModel: _homeModel?.results![index],
                            key: ValueKey<int>(
                                _homeModel?.results![index].id ?? -1),
                          ),
                        );
                      },
                      itemCount: _homeModel?.results!.length ?? 0,
                    ),
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
