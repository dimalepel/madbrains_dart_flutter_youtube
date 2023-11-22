import 'package:films_app/features/films/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../../features/films/pages/catalog_page.dart';
import '../models/film_card_model.dart';

class MainPage extends StatefulWidget {
  static const path = '/';

  const MainPage({super.key});

  static final List<_Tab> _tabs = [
    _Tab(
      icon: const Icon(
        Icons.local_movies_outlined,
      ),
      label: 'Feed',
      page: HomePage(
        title: 'Films',
        films: films,
      ),
    ),
    _Tab(
      icon: const Icon(
        Icons.movie_filter,
      ),
      label: 'Catalog',
      page: CatalogPage(
        title: 'Catalog',
        films: films,
      ),
    ),
  ];

  static final List<FilmCardModel> films = [
    FilmCardModel(
      id: 0,
      title: 'Брат',
      voteAverage: 8.3,
      picture: 'assets/images/poster_1.jpg',
      releaseDate: '1997',
      description:
          'Демобилизовавшись, Данила Багров вернулся в родной городок. Но скучная жизнь российской провинции не устраивала его, и он решился податься в Петербург, где, по слухам, уже несколько лет процветает его старший брат. Данила нашел брата. Но все оказалось не так просто — брат работает наемным убийцей.',
    ),
    FilmCardModel(
      id: 1,
      title: 'Служебный роман',
      voteAverage: 3.3,
      picture: 'assets/images/poster_2.jpeg',
      releaseDate: '1977',
      description:
          'Анатолий Ефремович Новосельцев, рядовой служащий одного статистического управления — человек робкий и застенчивый. Ему хотелось бы получить вакантное место зав. отделом, но он не знает как подступиться к этому делу. Старый приятель Самохвалов советует ему приударить за Людмилой Прокофьевной Калугиной — сухарем в юбке и директором заведения.',
    ),
    FilmCardModel(
      id: 2,
      title: 'Волк с Уолл-стрит',
      voteAverage: 7.0,
      picture: 'assets/images/poster_3.jpg',
      releaseDate: '2013',
      description:
          '1987 год. Джордан Белфорт становится брокером в успешном инвестиционном банке. Вскоре банк закрывается после внезапного обвала индекса Доу-Джонса. По совету жены Терезы Джордан устраивается в небольшое заведение, занимающееся мелкими акциями. Его настойчивый стиль общения с клиентами и врождённая харизма быстро даёт свои плоды. Он знакомится с соседом по дому Донни, торговцем, который сразу находит общий язык с Джорданом и решает открыть с ним собственную фирму. В качестве сотрудников они нанимают нескольких друзей Белфорта, его отца Макса и называют компанию «Стрэттон Оукмонт». В свободное от работы время Джордан прожигает жизнь: лавирует от одной вечеринки к другой, вступает в сексуальные отношения с проститутками, употребляет множество наркотических препаратов, в том числе кокаин и кваалюд. Однажды наступает момент, когда быстрым обогащением Белфорта начинает интересоваться агент ФБР...',
    ),
    FilmCardModel(
      id: 3,
      title: 'Бриллиантовая рука',
      voteAverage: 8.5,
      picture: 'assets/images/poster_4.jpeg',
      releaseDate: '1968',
      description:
          'В южном городке орудует шайка валютчиков, возглавляемая Шефом и его помощником Графом (в быту — Геной Козодоевым). Скромный советский служащий и примерный семьянин Семен Семенович Горбунков отправляется в зарубежный круиз на теплоходе, где также плывет Граф, который должен забрать бриллианты в одном из восточных городов и провезти их в загипсованной руке. Но из-за недоразумения вместо жулика на условленном месте падает ничего не подозревающий Семен Семенович, и драгоценный гипс накладывают ему.',
    ),
    FilmCardModel(
      id: 4,
      title: 'Интерстеллар',
      voteAverage: 8.6,
      picture: 'assets/images/poster_5.jpg',
      releaseDate: '2014',
      description:
          'Когда засуха, пыльные бури и вымирание растений приводят человечество к продовольственному кризису, коллектив исследователей и учёных отправляется сквозь червоточину (которая предположительно соединяет области пространства-времени через большое расстояние) в путешествие, чтобы превзойти прежние ограничения для космических путешествий человека и найти планету с подходящими для человечества условиями.',
    ),
  ];

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainPage._tabs.elementAt(_selectedIndex).page,
      bottomNavigationBar: BottomNavigationBar(
        items: List.generate(
          MainPage._tabs.length,
          (index) {
            final _Tab tab = MainPage._tabs[index];

            return BottomNavigationBarItem(
              icon: tab.icon,
              label: tab.label,
            );
          },
        ),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class _Tab {
  final Icon icon;
  final String label;
  final Widget page;

  _Tab({
    required this.icon,
    required this.label,
    required this.page,
  });
}
