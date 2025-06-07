import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/movie/usecases/get_now_playing_movies.dart';
import '../../../service_locator.dart';
import 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingMoviesLoading());

  void getNowPlayingMovies() async {
    var returnedDate = await sl<GetNowPlayingMoviesUseCase>().call();
    returnedDate.fold(
        (error) {
          emit(
            FailureLoadNowPlayingsMovies(errorMessage: error),
          );
        },
        (data) {
          emit(
            NowPlayingsMoviesLoaded(movies: data),
          );
        }

    );
  }
}