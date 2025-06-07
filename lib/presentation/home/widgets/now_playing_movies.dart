import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/core/configs/assets/app_images.dart';
import 'package:netflix/presentation/home/bloc/trendings_cubit.dart';

import '../../../common/widgets/movie/movie_card.dart';
import '../bloc/now_playing_cubit.dart';
import '../bloc/now_playing_state.dart';
import '../bloc/trendings_state.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NowPlayingCubit()..getNowPlayingMovies(),
        child: BlocBuilder<NowPlayingCubit, NowPlayingState> (
            builder: (context, state) {
              if (state is NowPlayingMoviesLoading) {
                return const Center(
                    child: CircularProgressIndicator()
                );
              }

              if (state is NowPlayingsMoviesLoaded) {
                return SizedBox(
                  height: 300,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        return MovieCard(
                          movieEntity: state.movies[index],
                        );
                      },
                      separatorBuilder: ((context, index) => const SizedBox(width: 8)),
                      itemCount: state.movies.length
                  ),
                );
              }

              if (state is FailureLoadNowPlayingsMovies) {
                return Text(state.errorMessage);
              }
              return Container();
            }
        )
    );
  }
}
