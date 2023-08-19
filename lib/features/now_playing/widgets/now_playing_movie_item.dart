import 'package:addx_assignment/domain/model/models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../components/loading_circle.dart';

class NowPlayingMovieItem extends StatelessWidget {
  final MovieNowPlaying model;

  NowPlayingMovieItem({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CachedNetworkImage(
            imageUrl: model.posterUrlPath,
            fit: BoxFit.fill,
            placeholder: (context, url) => LoadingCircle(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Positioned(
          right: 12,
            top: 6,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 14,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              model.voteAverage.toStringAsFixed(1),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}