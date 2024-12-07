import 'package:flutter/material.dart';
import 'package:mobile_programming/layout/api_page/detail_news_page.dart';
import 'package:mobile_programming/layout/model/get_news.dart';

class NewsCard extends StatelessWidget {
  final GetNews getNews;
  const NewsCard({super.key, required this.getNews});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) {
              return DetailNewsPage(getNews: getNews);
            }),
          ),
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: Card.outlined(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 12.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  getNews.title.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Divider(),
                Text(
                  getNews.body,
                  style: const TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
