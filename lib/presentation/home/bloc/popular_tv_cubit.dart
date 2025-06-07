import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/presentation/home/bloc/popular_tv_state.dart';

import '../../../domain/movie/usecases/get_now_playing_movies.dart';
import '../../../domain/tv/usecases/get_popular_tv.dart';
import '../../../service_locator.dart';
import 'now_playing_state.dart';

class PopularTVCubit extends Cubit<PopularTVState> {
  PopularTVCubit() : super(PopularTVLoading());

  void getPopularTVMovies() async {
    var returnedDate = await sl<GetPopularTVUseCase>().call();
    returnedDate.fold(
            (error) {
          emit(
            FailureLoadPopularMovies(errorMessage: error),
          );
        },
            (data) {
          emit(
            PopularTVLoaded(tv: data),
          );
        }

    );
  }
}