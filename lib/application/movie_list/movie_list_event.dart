part of 'movie_list_bloc.dart';

@immutable
abstract class MovieListEvent {}

class MovieListDownloadMoviesEvent extends MovieListEvent {}