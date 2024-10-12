class Manga {
  final String title;
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;
  final String type;
  final String synopsis;
  final int rank;
  final double score;
  final int favorites;
  final String url;
  final List<String> genres;

  Manga({
    required this.title,
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
    required this.type,
    required this.synopsis,
    required this.rank,
    required this.score,
    required this.favorites,
    required this.url,
    required this.genres,
  });

  // Convert from JSON
  factory Manga.fromJson(Map<String, dynamic> json) {
    return Manga(
      title: json['title'],
      imageUrl: json['images']['jpg']['image_url'],
      smallImageUrl: json['images']['jpg']['small_image_url'],
      largeImageUrl: json['images']['jpg']['large_image_url'],
      type: json['type'] ?? '',
      synopsis: json['synopsis'] ?? '',
      rank: json['rank'] ?? 0,
      score: (json['score'] ?? 0).toDouble(),
      favorites: json['favorites'] ?? 0,
      url: json['url'] ?? '',
      genres: (json['genres'] as List<dynamic>)
          .map((e) => e['name'] as String)
          .toList(),
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'images': {
        'jpg': {
          'image_url': imageUrl,
          'small_image_url': smallImageUrl,
          'large_image_url': largeImageUrl,
        }
      },
      'type': type,
      'synopsis': synopsis,
      'rank': rank,
      'score': score,
      'favorites': favorites,
      'url': url,
      'genres': genres.map((genre) => {'name': genre}).toList(),
    };
  }
}
