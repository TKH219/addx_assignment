import '../../response/response.dart';

abstract class MoviesClient {
  Future<GetNowPlayingResponse> onGetNowPlaying({
    required int page,
  });
}