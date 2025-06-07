import '../../../domain/movie/entities/movie.dart';

abstract class NowPlayingState {}

class NowPlayingMoviesLoading extends NowPlayingState {}

class NowPlayingsMoviesLoaded extends NowPlayingState {
  final List<MovieEntity> movies;
  NowPlayingsMoviesLoaded({required this.movies});
}

class FailureLoadNowPlayingsMovies extends NowPlayingState {
  final String errorMessage;
  FailureLoadNowPlayingsMovies({required this.errorMessage});
}