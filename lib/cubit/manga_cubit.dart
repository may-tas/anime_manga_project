import 'dart:convert';

import 'package:anime_manga_project/cubit/manga_state.dart';
import 'package:anime_manga_project/models/manga_model.dart';
import 'package:anime_manga_project/services/manga_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MangaCubit extends Cubit<MangaState> {
  MangaCubit() : super(MangaLoading());

  Future<void> fetchMangas() async {
    emit(MangaLoading());

    try {
      final List<Manga>? cachedMangas = await _loadMangasFromCache();

      if (cachedMangas != null && cachedMangas.isNotEmpty) {
        emit(MangaLoaded(mangas: cachedMangas));
      } else {
        // Fetch data from API
        final mangas = await MangaService.getMangas();

        await _saveMangasToCache(mangas);

        emit(MangaLoaded(mangas: mangas));
      }
    } catch (e) {
      emit(MangaError(message: e.toString()));
    }
  }

  // Method to save mangas to SharedPreferences
  Future<void> _saveMangasToCache(List<Manga> mangas) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String encodedMangas = jsonEncode(
      mangas.map((manga) => manga.toJson()).toList(),
    );

    await prefs.setString('cached_mangas', encodedMangas);
  }

  // Method to load mangas from SharedPreferences
  Future<List<Manga>?> _loadMangasFromCache() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? cachedMangas = prefs.getString('cached_mangas');

    if (cachedMangas != null) {
      final List<dynamic> decodedJson = jsonDecode(cachedMangas);
      return decodedJson.map((json) => Manga.fromJson(json)).toList();
    }

    return null;
  }
}
