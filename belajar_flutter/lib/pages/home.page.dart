import 'package:belajar_flutter/components/news.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita terbaru saat ini'),
      ),
      body: const SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            News(
              title: 'Ini judul',
              image:
                  'https://3.bp.blogspot.com/-hDk7AwXj5Os/UYBDZdkmG1I/AAAAAAAAEzQ/_rFohGALRPE/s1600/Gambar-Ayam-Jantan.jpg',
            ),
            News(
              title: 'Ini judul',
              image:
                  'https://3.bp.blogspot.com/-hDk7AwXj5Os/UYBDZdkmG1I/AAAAAAAAEzQ/_rFohGALRPE/s1600/Gambar-Ayam-Jantan.jpg',
            ),
            News(
              title: 'Ini judul',
              image:
                  'https://3.bp.blogspot.com/-hDk7AwXj5Os/UYBDZdkmG1I/AAAAAAAAEzQ/_rFohGALRPE/s1600/Gambar-Ayam-Jantan.jpg',
            ),
            News(
              title: 'Ini judul',
              image:
                  'https://3.bp.blogspot.com/-hDk7AwXj5Os/UYBDZdkmG1I/AAAAAAAAEzQ/_rFohGALRPE/s1600/Gambar-Ayam-Jantan.jpg',
            ),
          ],
        ),
      )),
    );
  }
}
