import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/domain/tv/entities/tv.dart';
import 'package:netflix/domain/tv/usecases/get_popular_tv.dart';
import 'package:netflix/service_locator.dart';

import '../../../common/widgets/tv/tv_card.dart';
import '../bloc/popular_tv_cubit.dart';
import '../bloc/popular_tv_state.dart';

class PopularTv extends StatelessWidget {
  const PopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PopularTVCubit()..getPopularTVMovies(),
        child: BlocBuilder<PopularTVCubit, PopularTVState>(
          builder: (context, state) {
            if (state is PopularTVLoading){
              return const Center(
                  child: CircularProgressIndicator()
              );
            }

            if (state is PopularTVLoaded ){
              return SizedBox(
                height: 300,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      return TVCard(
                        tvEntity: state.tv[index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(width: 10,),
                    itemCount: state.tv.length
                ),
              );
            }

            if (state is FailureLoadPopularMovies) {
              return Center(child: Text(state.errorMessage));
            }

            return Container();
          },
        )
    );
  }
}