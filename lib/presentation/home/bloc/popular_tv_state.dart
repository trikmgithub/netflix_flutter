import 'package:netflix/domain/tv/entities/tv.dart';

abstract class PopularTVState {}

class PopularTVLoading extends PopularTVState {}

class PopularTVLoaded extends PopularTVState {
  final List<TVEntity> tv;
  PopularTVLoaded({required this.tv});
}

class FailureLoadPopularMovies extends PopularTVState {
  final String errorMessage;
  FailureLoadPopularMovies({required this.errorMessage});
}