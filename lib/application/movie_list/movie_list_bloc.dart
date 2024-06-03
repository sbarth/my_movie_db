import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/movie.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListBloc() : super(MovieListStateInitial()) {
    on<MovieListDownloadMoviesEvent>((event, emit) async {
      emit(MovieListStateDownloadMovieTitles());
      var movies = await getMovies();

      if (movies == null) {
        emit(MovieListStateDownloadMovieTitlesFailed());
      }

      emit(MovieListStateDownloadMovieTitlesFinished(movies: movies));
    });
  }

  Future<List<Movie>> getMovies() async {
    return Future.delayed(const Duration(milliseconds: 5000), () async {
      return [];
    });
  }
}