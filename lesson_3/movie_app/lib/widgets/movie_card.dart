import 'package:flutter/material.dart';

import '../utils/utils.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String picture;
  final Language language;
  final bool isSubscription;
  final double rating;
  final bool isLast;

  const MovieCard({
    super.key,
    required this.title,
    required this.picture,
    required this.language,
    required this.isSubscription,
    required this.rating,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: (isLast) ? 0 : 30
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
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        right: 10
                      ),
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
                        language.toPrettyString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xffffffff),
                            fontSize: 16
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 8
                      ),
                      margin: const EdgeInsets.only(
                          right: 10
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: const Color(0xffffffff)
                          ),
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xff6A11CB),
                                Color(0xff2575FC)
                              ]
                          )
                      ),
                      child: Text(
                        rating.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xffffffff),
                            fontSize: 16
                        ),
                      ),
                    ),
                    if (isSubscription) Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 8
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: const Color(0xffffffff)
                          ),
                        color: Colors.orange
                      ),
                      child: const Text(
                        'Подписка',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xffffffff),
                            fontSize: 16
                        ),
                      ),
                    ),
                  ],
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
