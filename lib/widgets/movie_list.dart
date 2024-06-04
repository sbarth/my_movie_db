import 'package:flutter/material.dart';
import 'package:my_movie_db/main.dart';
import 'package:my_movie_db/providers/movie_provider.dart';
import 'package:provider/provider.dart';

import '../model/movie.dart';

class MovieListView extends StatelessWidget {
  MovieListView({super.key});

  @override
  Widget build(BuildContext context) {
    final themData = Theme.of(context);
    final movies = Provider.of<MovieProvider>(context).movies;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themData.colorScheme.primary,
        title: const Text(
          "My Movies",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.separated(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return MovieTile(movie: movies[index]);
        },
        separatorBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Divider(
              height: 1,
              color: Colors.black12,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.of(context).pushNamed(routeMovieAdd);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MovieTile extends StatelessWidget {
  final Movie movie;

  const MovieTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(movie.poster),
      title: Text(movie.name),
    );
  }
}
