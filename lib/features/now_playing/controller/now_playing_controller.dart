import 'package:addx_assignment/domain/use_cases/movies_user_case.dart';
import 'package:get/get.dart';

import '../../../domain/model/models.dart';
import '../../../utils/constants/constants.dart';

class NowPlayingController extends GetxController {
  MoviesUseCase moviesUseCase;

  NowPlayingController(this.moviesUseCase);

  RxList<MovieNowPlaying> movies = <MovieNowPlaying>[].obs;

  int currentPage = 1;

  bool hasMore = true;

  Future<void> getNowPlaying({bool showLoading = true}) async {
    final result = await moviesUseCase.onGetNowPlaying(
      limit: limitUser,
      page: currentPage,
    );

    result.fold((failure) {
      failure.handleError();
    }, (data) {
      final List<MovieNowPlaying> listData = data.results.map((element) => MovieNowPlaying.fromEntity(element)).toList();
      movies.addAll(listData);
      // hasMore = data.hasMore ?? false;
      if (hasMore) {
        currentPage += 1;
      }

      update();
    });
  }

  @override
  void dispose() {
    movies.close();
    super.dispose();
  }
}
