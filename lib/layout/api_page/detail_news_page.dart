import 'package:flutter/material.dart';
import 'package:mobile_programming/layout/model/get_news.dart';

class DetailNewsPage extends StatelessWidget {
  final GetNews getNews;
  const DetailNewsPage({super.key, required this.getNews});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Post Detail',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'ID #${getNews.id}',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12.0),
            const Text(
              'Title:',
              style: TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6.0),
            Text(
              getNews.title.toUpperCase(),
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12.0),
            const Divider(),
            const SizedBox(height: 12.0),
            const Text(
              'Body:',
              style: TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6.0),
            Text(
              getNews.body,
              style: const TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      )),
    );
  }
}
