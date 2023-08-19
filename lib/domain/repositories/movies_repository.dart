import 'package:dartz/dartz.dart';
import '../../core/failure.dart';
import '../../data/response/response.dart';
import '../model/models.dart';

abstract class MoviesRepository {
  Future<Either<Failure, GetNowPlayingResponse>> onGetNowPlaying({
    required int page,
  });
}
