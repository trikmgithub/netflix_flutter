import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix/core/configs/assets/app_vectors.dart';
import 'package:netflix/presentation/home/widgets/category_text.dart';

import '../../../common/widgets/appbar/app_bar.dart';
import '../widgets/now_playing_movies.dart';
import '../widgets/trending_movies.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SvgPicture.asset(
            AppVectors.logo,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryText(title: 'Trendings'),
            TrendingMovies(),
            SizedBox(height: 16),
            CategoryText(title: 'Now Playing'),
            SizedBox(height: 16),
            NowPlayingMovies(),
            SizedBox(height: 16),
            CategoryText(title: 'PopularTV'),
            SizedBox(height: 16),
          ],
        )
      ),
    );
  }
}
