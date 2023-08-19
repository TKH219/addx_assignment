import 'package:json_annotation/json_annotation.dart';
import '../../../data/entities/entity.dart';
import '../../../utils/constants/constants.dart';

part 'movie_now_playing.g.dart';

@JsonSerializable()
class MovieNowPlaying extends Object {
  final bool adult;
  final String? backdropPath;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final double voteCount;
  final List<int> genreIds;

  factory MovieNowPlaying.fromJson(Map<String, dynamic> json) =>
      _$MovieNowPlayingFromJson(json);

  Map<String, dynamic> toJson() => _$MovieNowPlayingToJson(this);

  MovieNowPlaying({
    required this.adult,
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
    this.backdropPath,
    this.genreIds = const <int>[],
  });

  factory MovieNowPlaying.fromEntity(MovieNowPlayingEntity entity) {
    return MovieNowPlaying(
      adult: entity.adult,
      backdropPath: entity.backdropPath,
      id: entity.id,
      originalLanguage: entity.originalLanguage,
      originalTitle: entity.originalTitle,
      overview: entity.overview,
      popularity: entity.popularity,
      posterPath: entity.posterPath,
      releaseDate: entity.releaseDate,
      title: entity.title,
      video: entity.video,
      voteAverage: entity.voteAverage,
      voteCount: entity.voteCount,
    );
  }

  String get posterUrlPath => '$baseImageUrl$posterPath';
}
