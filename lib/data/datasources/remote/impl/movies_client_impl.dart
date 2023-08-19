import 'package:addx_assignment/data/datasources/remote/movies_client.dart';

import '../../../../core/base_client.dart';
import '../../../response/response.dart';

class MoviesClientImpl extends BaseClient implements MoviesClient {

  @override
  Future<GetNowPlayingResponse> onGetNowPlaying({required int limit, required int page}) async {
    final response = await get(
      "/2.2/users?",
      params: {
        'pagesize': limit,
        'page': page,
        'site': 'stackoverflow',
      },
    );

    return GetNowPlayingResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
