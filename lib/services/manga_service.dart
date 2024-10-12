import 'package:dio/dio.dart';
import 'package:anime_manga_project/models/manga_model.dart';

class MangaService {
  static Future<List<Manga>> getMangas() async {
    try {
      final Dio dio = Dio();
      final response = await dio.get(
        'https://api.jikan.moe/v4/top/manga',
        queryParameters: {
          'type': 'manga',
          'filter': 'bypopularity',
          'limit': 12,
          'page': 1,
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];

        // Parsing JSON into List<Manga>
        final dataResponse = data.map((item) => Manga.fromJson(item)).toList();
        return dataResponse;
      } else {
        throw Exception('Failed to load mangas');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
