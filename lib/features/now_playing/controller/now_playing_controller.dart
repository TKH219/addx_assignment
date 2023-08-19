import 'package:addx_assignment/domain/use_cases/movies_user_case.dart';
import 'package:get/get.dart';

import '../../../domain/model/models.dart';

class NowPlayingController extends GetxController {
  MoviesUseCase moviesUseCase;

  NowPlayingController(this.moviesUseCase);

  RxList<MovieNowPlaying> movies = <MovieNowPlaying>[].obs;

  int currentPage = 1;
  int totalPages = 1;

  bool hasMore = true;

  Future<void> getNowPlaying({
    bool isRefresh = false,
  }) async {
    final result = await moviesUseCase.onGetNowPlaying(
      page: currentPage,
    );

    result.fold((failure) {
      failure.handleError();
    }, (data) {
      final List<MovieNowPlaying> listData = data.results.map((element) => MovieNowPlaying.fromEntity(element)).toList();
      if (isRefresh) {
        movies.clear();
      }

      movies.addAll(listData);
      totalPages = data.totalPages ?? 1;
      if (totalPages > currentPage) {
        currentPage += 1;
      }

      update();
    });
  }

  Future<void> onRefresh() async {
    currentPage = 1;
    await getNowPlaying(isRefresh: true,);
  }

  Future<void> onLoadMore() async {
    await getNowPlaying();
  }

  @override
  void dispose() {
    movies.close();
    super.dispose();
  }
}
