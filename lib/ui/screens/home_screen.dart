import 'package:anime_manga_project/cubit/manga_state.dart';
import 'package:anime_manga_project/ui/screens/details_screen.dart';
import 'package:anime_manga_project/ui/widgets/manga_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anime_manga_project/cubit/manga_cubit.dart';
import 'package:anime_manga_project/models/manga_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 4,
        title: const Text(
          "Top 10 Most Popular Manga ",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<MangaCubit, MangaState>(
        builder: (context, state) {
          if (state is MangaLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MangaError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is MangaLoaded) {
            final List<Manga> mangas =
                state.mangas.take(10).toList(); // Limit 10 mangas

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: mangas.length,
              itemBuilder: (context, index) {
                final manga = mangas[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(manga: manga),
                      ),
                    );
                  },
                  child: MangaCard(manga: manga),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
