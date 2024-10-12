import 'package:anime_manga_project/models/manga_model.dart';

abstract class MangaState {}

class MangaInitial extends MangaState {}

class MangaLoading extends MangaState {}

class MangaLoaded extends MangaState {
  final List<Manga> mangas;

  MangaLoaded({required this.mangas});
}

class MangaError extends MangaState {
  final String message;

  MangaError({required this.message});
}
