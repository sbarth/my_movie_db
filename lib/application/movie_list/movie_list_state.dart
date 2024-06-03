part of 'movie_list_bloc.dart';

@immutable
abstract class MovieListState {}

class MovieListStateInitial extends MovieListState {}

class MovieListStateDownloadMovieTitles extends MovieListState {}

class MovieListStateDownloadMovieTitlesFinished extends MovieListState {
  final List<Movie> movies;

  MovieListStateDownloadMovieTitlesFinished({required this.movies}) {}
}

class MovieListStateDownloadMovieTitlesFailed extends MovieListState {}