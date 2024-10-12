import 'package:anime_manga_project/ui/widgets/detail_content.dart';
import 'package:flutter/material.dart';
import 'package:anime_manga_project/models/manga_model.dart';

class DetailScreen extends StatelessWidget {
  final Manga manga;

  const DetailScreen({super.key, required this.manga});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          manga.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: DetailContent(),
      ),
    );
  }
}
