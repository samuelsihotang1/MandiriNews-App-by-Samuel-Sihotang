import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget {
  final String? title, image;
  const News({super.key, this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: FancyShimmerImage(
                boxFit: BoxFit.cover,
                imageUrl: image ??
                    'https://via.placeholder.com/150x100.png?text=No+Image',
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Text(
            title ?? 'Tidak ada Judul',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ))
        ],
      ),
    );
  }
}
