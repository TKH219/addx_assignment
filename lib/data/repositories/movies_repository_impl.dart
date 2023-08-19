import 'package:addx_assignment/data/datasources/local/storage_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../core/failure.dart';
import '../../domain/repositories/movies_repository.dart';
import '../datasources/remote/movies_client.dart';
import '../response/response.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  MoviesClient moviesClient;

  MoviesRepositoryImpl(this.moviesClient);

  @override
  Future<Either<Failure, GetNowPlayingResponse>> onGetNowPlaying({
    required int page,
  }) async {
    try {
      final GetNowPlayingResponse response = await moviesClient.onGetNowPlaying(
        page: page,
      );

      return Right(response);
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error));
      } else {
        return Left(GeneralFailure(error));
      }
    }
  }
}
