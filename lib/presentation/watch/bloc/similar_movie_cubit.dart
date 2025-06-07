import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/domain/movie/usecases/get_similar_movies.dart';
import 'package:netflix/presentation/watch/bloc/recommendation_movies_state.dart';
import 'package:netflix/presentation/watch/bloc/similar_movie_state.dart';

import '../../../domain/movie/usecases/get_recommendation_movies.dart';
import '../../../service_locator.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit() : super(SimilarMoviesLoading());

  void getSimilarMovies(int movieId) async {
    var returnedDate = await sl<GetSimilarMoviesUseCase>().call(params: movieId);
    returnedDate.fold(
          (error) {
        emit(FailureLoadSimilarMovies(errorMessage: error));
      },
          (data) {
        emit(SimilarMoviesLoaded(movies: data));
      },
    );
  }
}
