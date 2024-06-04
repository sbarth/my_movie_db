import 'package:flutter/material.dart';
import 'package:my_movie_db/application/movie_list/movie_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieList extends StatelessWidget {
  final MovieListBloc bloc = MovieListBloc();

  MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    final themData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themData.colorScheme.primary,
        title: const Text(
          "My Movies",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: BlocProvider(
          create: (context) => bloc..add(MovieListDownloadMoviesEvent()),
          child: BlocBuilder<MovieListBloc, MovieListState>(
            builder: (context, state) {
              if (state is MovieListStateInitial) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator(color: themData.colorScheme.secondary), const Text("Initialize...")],
                );
              } else if (state is MovieListStateDownloadMovieTitles) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator(color: themData.colorScheme.secondary), const Text("Download Movie titles...")],
                );
              } else if (state is MovieListStateDownloadMovieTitlesFailed) {
                return const Text("Something went wrong");
              } else if (state is MovieListStateDownloadMovieTitlesFinished) {
                return ListView.separated(
                  itemCount: state.movies.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(state.movies[index].poster),
                      title: Text(state.movies[index].name),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                );
              } else {
                return const Text("Should not reach here!");
              }
            }
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          // Cloud.addMovie(Movie(name: "awd", year: 1999, imdbId: "imdbId", type: "type", poster: "poster"));
          // bloc.add(MovieListDownloadMoviesEvent());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
