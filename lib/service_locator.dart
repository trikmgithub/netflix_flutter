import 'package:get_it/get_it.dart';
import 'package:netflix/data/movie/sources/movie.dart';
import 'package:netflix/data/tv/sources/tv.dart';
import 'package:netflix/domain/auth/repositories/auth.dart';
import 'package:netflix/domain/auth/usecases/is_logged_in.dart';
import 'package:netflix/domain/auth/usecases/signup.dart';
import 'package:netflix/domain/movie/repositories/movie.dart';
import 'package:netflix/domain/movie/usecases/get_recommendation_movies.dart';
import 'package:netflix/domain/movie/usecases/get_trending_movies.dart';
import 'package:netflix/domain/tv/usecases/get_popular_tv.dart';

import 'core/network/dio_client.dart';
import 'data/auth/repositories/auth.dart';
import 'data/auth/sources/auth_api_service.dart';
import 'data/movie/repositories/movie.dart';
import 'data/tv/repositories/tv.dart';
import 'domain/auth/usecases/signin.dart';
import 'domain/movie/usecases/get_movie_trailer.dart';
import 'domain/movie/usecases/get_now_playing_movies.dart';
import 'domain/movie/usecases/get_similar_movies.dart';
import 'domain/tv/repositories/tv.dart';

final sl = GetIt.instance;

void setupServiceLocator() {

  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthService>(AuthServiceImpl());
  sl.registerSingleton<MovieService>(MovieServiceImpl());
  sl.registerSingleton<TVService>(TVApiServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<TVRepository>(TVRepositoryImpl());

  // Use cases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
  sl.registerSingleton<GetNowPlayingMoviesUseCase>(GetNowPlayingMoviesUseCase());
  sl.registerSingleton<GetPopularTVUseCase>(GetPopularTVUseCase());
  sl.registerSingleton<GetMovieTrailerUseCase>(GetMovieTrailerUseCase());
  sl.registerSingleton<GetRecommendationMoviesUseCase>(GetRecommendationMoviesUseCase());
  sl.registerSingleton<GetSimilarMoviesUseCase>(GetSimilarMoviesUseCase());
}