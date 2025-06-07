import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/presentation/watch/bloc/recommendation_movies_state.dart';

import '../../../domain/movie/usecases/get_recommendation_movies.dart';
import '../../../service_locator.dart';

class RecommendationMoviesCubit extends Cubit<RecommendationMoviesState> {
  RecommendationMoviesCubit() : super(RecommendationMoviesLoading());

  void getRecommendationMovies(int movieId) async {
    var returnedDate = await sl<GetRecommendationMoviesUseCase>().call(params: movieId);
    returnedDate.fold(
      (error) {
        emit(FailureLoadRecommendationsMovies(errorMessage: error));
      },
      (data) {
        emit(RecommendationsMoviesLoaded(movies: data));
      },
    );
  }
}
