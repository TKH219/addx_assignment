import 'package:addx_assignment/data/entities/entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'base_response.dart';

part 'get_now_playing_response.g.dart';

@JsonSerializable()
class GetNowPlayingResponse extends BaseResponse {
  @JsonKey(name: 'results')
  List<MovieNowPlayingEntity> results;

  GetNowPlayingResponse({
    required this.results,
  }) : super();

  factory GetNowPlayingResponse.fromJson(Map<String, dynamic> json) =>
      _$GetNowPlayingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetNowPlayingResponseToJson(this);
}
