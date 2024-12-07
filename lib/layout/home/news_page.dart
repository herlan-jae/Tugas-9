import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_programming/layout/api_page/news_card.dart';
import 'package:mobile_programming/layout/home/grid_view_learning.dart';
import 'package:mobile_programming/layout/home/home_page_with_menu.dart';
import 'package:mobile_programming/layout/home/list_view_learning.dart';
import 'package:mobile_programming/layout/home/my_home_page.dart';
import 'package:mobile_programming/layout/model/get_news.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Future<List<GetNews>> fetchPost() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var getPostsData = json.decode(response.body) as List;
      var listPosts = getPostsData.map((i) => GetNews.fromJson(i)).toList();
      return listPosts;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  late Future<List<GetNews>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Post List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 12.0,
          ),
          child: FutureBuilder<List<GetNews>>(
            future: futurePosts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  itemBuilder: ((context, index) {
                    var post = (snapshot.data as List<GetNews>)[index];
                    return Column(
                      children: [
                        NewsCard(
                          getNews: GetNews(
                            id: post.id,
                            title: post.title,
                            body: post.body,
                          ),
                        ),
                      ],
                    );
                  }),
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: (snapshot.data as List<GetNews>).length,
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressWidget();
            },
          ),
        ),
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Herlan\'s Flutter App',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '20230801327 Herlan Jaelani',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Teknik Informatika',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Main Screen'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) {
                    return const MainScreen();
                  }),
                ),
              );
            },
            trailing: const Icon(Icons.arrow_forward_rounded),
          ),
          const Divider(),
          ListTile(
            title: const Text('My Home Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) {
                    return const MyHomePage(
                      title: 'My Home Page',
                    );
                  }),
                ),
              );
            },
            trailing: const Icon(Icons.arrow_forward_rounded),
          ),
          const Divider(),
          ListTile(
            title: const Text('Grid View Learning'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) {
                    return const GridViewLearning();
                  }),
                ),
              );
            },
            trailing: const Icon(Icons.arrow_forward_rounded),
          ),
          const Divider(),
          ListTile(
            title: const Text('List View Learning'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) {
                    return const ListViewLearning();
                  }),
                ),
              );
            },
            trailing: const Icon(Icons.arrow_forward_rounded),
          ),
          const Divider(),
        ],
      )),
    );
  }
}

class CircularProgressWidget extends StatelessWidget {
  const CircularProgressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.all(8.0),
        child: CircularProgressIndicator(
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
