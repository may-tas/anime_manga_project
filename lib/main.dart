import 'package:anime_manga_project/cubit/manga_cubit.dart';
import 'package:anime_manga_project/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime Manga Project',
      home: BlocProvider(
        create: (context) => MangaCubit()..fetchMangas(),
        child: const HomeScreen(),
      ),
    );
  }
}
