import 'package:json_annotation/json_annotation.dart';
import '../../../data/entities/entity.dart';

part 'movie_now_playing.g.dart';

@JsonSerializable()
class MovieNowPlaying extends Object {

  @JsonKey(name: 'adult')
  final bool adult;
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @JsonKey(name: 'original_title')
  final String originalTitle;
  @JsonKey(name: 'overview')
  final String overview;
  @JsonKey(name: 'popularity')
  final double popularity;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'video')
  final bool video;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final double voteCount;
  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;

  factory MovieNowPlaying.fromJson(Map<String, dynamic> json) => _$MovieNowPlayingFromJson(json);

  Map<String, dynamic> toJson() => _$MovieNowPlayingToJson(this);

  MovieNowPlaying({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.genreIds = const <int>[],
  });

// factory MovieNowPlaying.fromEntity(SofUserReputationEntity entity) {
  //   return SofUserReputationModel(
  //     creationDate: entity.creationDateTime,
  //     postId: entity.postId,
  //     reputationChange: entity.reputationChange,
  //     reputationHistoryType: entity.reputationHistoryType,
  //     userId: entity.userId,
  //   );
  // }
}
