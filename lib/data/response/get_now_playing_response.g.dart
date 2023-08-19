// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_now_playing_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNowPlayingResponse _$GetNowPlayingResponseFromJson(
        Map<String, dynamic> json) =>
    GetNowPlayingResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieNowPlayingEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..page = json['page'] as int?
      ..totalPages = json['total_pages'] as int?
      ..totalResults = json['total_results'] as int?;

Map<String, dynamic> _$GetNowPlayingResponseToJson(
        GetNowPlayingResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };
