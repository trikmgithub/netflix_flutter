import '../../../domain/movie/entities/movie.dart';

abstract class RecommendationMoviesState {}

class RecommendationMoviesLoading extends RecommendationMoviesState {}

class RecommendationsMoviesLoaded extends RecommendationMoviesState {
  final List<MovieEntity> movies;
  RecommendationsMoviesLoaded({required this.movies});
}

class FailureLoadRecommendationsMovies extends RecommendationMoviesState {
  final String errorMessage;
  FailureLoadRecommendationsMovies({required this.errorMessage});
}