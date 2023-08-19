import 'package:dartz/dartz.dart';
import '../../core/failure.dart';
import '../../data/response/response.dart';
import '../model/models.dart';

abstract class MoviesUseCase {
  Future<Either<Failure, GetNowPlayingResponse>> onGetNowPlaying({
    required int limit,
    required int page,
  });
}
