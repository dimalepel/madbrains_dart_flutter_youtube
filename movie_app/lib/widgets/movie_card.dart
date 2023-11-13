import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String picture;
  final dynamic language;

  const MovieCard({
    super.key,
    required this.title,
    required this.picture,
    required this.language
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 30
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(picture)
              ),
              Positioned(
                left: 10,
                top: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 8
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xffffffff)
                    ),
                    color: const Color.fromARGB(60, 9, 9, 12)
                  ),
                  child: Text(
                    language,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xffffffff),
                      fontSize: 16
                    ),
                  ),
                ),
              ),
            ]
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xffffffff)
              )
            ),
          ),
        ],
      ),
    );
  }
}
