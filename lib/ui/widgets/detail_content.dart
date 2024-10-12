import 'package:anime_manga_project/models/manga_model.dart';
import 'package:anime_manga_project/ui/screens/details_screen.dart';
import 'package:anime_manga_project/utils/launch_url_util.dart';
import 'package:flutter/material.dart';

class DetailContent extends StatelessWidget {
  const DetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailScreen parent =
        context.findAncestorWidgetOfExactType<DetailScreen>()!;
    final Manga manga = parent.manga;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              manga.largeImageUrl,
              fit: BoxFit.cover,
              height: 300, // Set a fixed height for better layout
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Type: ${manga.type}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Synopsis:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          Text(
            manga.synopsis,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Details:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          _buildDetailText('Rank: ${manga.rank}'),
          _buildDetailText('Score: ${manga.score}'),
          _buildDetailText('Favorites: ${manga.favorites}'),
          _buildDetailText('Genres: ${manga.genres.join(', ')}'),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton(
              onPressed: () => launchURL(manga.url),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent, // Button color
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Rounded button
                ),
              ),
              child: const Text(
                'More Info',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
