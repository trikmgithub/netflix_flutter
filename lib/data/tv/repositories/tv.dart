import 'package:dartz/dartz.dart';
import 'package:netflix/data/tv/sources/tv.dart';
import 'package:netflix/domain/tv/repositories/tv.dart';

import '../../../common/helper/mapper/tv_mapper.dart';
import '../../../service_locator.dart';
import '../models/tv.dart';

class TVRepositoryImpl extends TVRepository {
  @override
  Future<Either> getPopularTV() async {
    var returnedData = await sl<TVService>().getPopularTv();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((item) => TvMapper.toEntity(TVModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }

}