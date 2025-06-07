import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/presentation/home/bloc/trendings_state.dart';

import '../../../domain/movie/usecases/get_trending_movies.dart';
import '../../../service_locator.dart';

class TrendingsCubit extends Cubit<TrendingsState> {
  TrendingsCubit() : super(TrendingMoviesLoading());

  void getTrendingMovies() async {
    var returnedDate = await sl<GetTrendingMoviesUseCase>().call();
    returnedDate.fold(
        (error) {
          emit(
            FailureLoadTrendingMovies(errorMessage: error),
          );
        },
        (data) {
          emit(
            TrendingMoviesLoaded(movies: data),
          );
        }

    );
  }
}