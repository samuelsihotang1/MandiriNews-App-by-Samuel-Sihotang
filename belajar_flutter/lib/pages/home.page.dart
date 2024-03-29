import 'package:belajar_flutter/components/news.dart';
import 'package:belajar_flutter/providers/news.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).getTopNews();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
        builder: (BuildContext context, news, Widget? child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Berita terbaru saat ini'),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              news.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        ...news.resNews!.articles!.map(
                          (e) => News(
                            title: e.title ?? 'No Title',
                            image: e.urlToImage ??
                                'https://via.placeholder.com/150x100.png?text=No+Image',
                          ),
                        )
                      ],
                    ),
            ],
          ),
        )),
      );
    });
  }
}
