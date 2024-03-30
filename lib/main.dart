import 'package:MandiriNews/components/customListTile.dart';
import 'package:MandiriNews/components/everythingList.dart';
import 'package:MandiriNews/models/topNews.model.dart';
import 'package:MandiriNews/providers/news.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewsProvider>(
      create: (context) => NewsProvider(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).getTopNews();
    Provider.of<NewsProvider>(context, listen: false).getEverthingNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          children: <Widget>[
            CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.blue,
            ),
            SizedBox(width: 10.0),
            Text(
              "Mandiri News",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Consumer<NewsProvider>(
        builder: (context, newsProvider, child) {
          if (newsProvider.isLoading) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.blue));
          } else if (newsProvider.resNews != null &&
              newsProvider.resEverythingNews != null) {
            List<Articles>? articles = newsProvider.resNews!.articles!;
            List<Articles>? everythingsArticles =
                newsProvider.resEverythingNews!.articles!;
            return ListView.builder(
              itemCount: articles.length + everythingsArticles.length + 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Berita Terkini',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                } else if (index <= articles.length) {
                  return customListTile(articles[index - 1], context);
                } else if (index == articles.length + 1) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Semua Berita',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                } else {
                  return everythingListTile(
                      everythingsArticles[index - articles.length - 2],
                      context);
                }
              },
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(color: Colors.blue));
          }
        },
      ),
    );
  }
}
