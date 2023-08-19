// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_now_playing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieNowPlaying _$MovieNowPlayingFromJson(Map<String, dynamic> json) =>
    MovieNowPlaying(
      adult: json['adult'] as bool,
      id: json['id'] as int,
      originalLanguage: json['originalLanguage'] as String,
      originalTitle: json['originalTitle'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['posterPath'] as String?,
      releaseDate: json['releaseDate'] as String,
      title: json['title'] as String,
      video: json['video'] as bool,
      voteAverage: (json['voteAverage'] as num).toDouble(),
      voteCount: (json['voteCount'] as num).toDouble(),
      backdropPath: json['backdropPath'] as String?,
      genreIds:
          (json['genreIds'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              const <int>[],
    );

Map<String, dynamic> _$MovieNowPlayingToJson(MovieNowPlaying instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdropPath': instance.backdropPath,
      'id': instance.id,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'posterPath': instance.posterPath,
      'releaseDate': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
      'genreIds': instance.genreIds,
    };
