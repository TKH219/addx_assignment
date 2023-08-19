import 'package:dartz/dartz.dart';

import '../../../core/failure.dart';
import '../../../data/response/response.dart';
import '../../repositories/movies_repository.dart';
import '../movies_user_case.dart';

class MoviesUseCaseImpl implements MoviesUseCase {
  MoviesRepository moviesRepository;

  MoviesUseCaseImpl(this.moviesRepository);

  @override
  Future<Either<Failure, GetNowPlayingResponse>> onGetNowPlaying(
      {required int limit, required int page}) async {
    final result = await moviesRepository.onGetNowPlaying(
      page: page,
      limit: limit,
    );
    return result;
  }
}
