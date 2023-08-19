import 'package:addx_assignment/features/now_playing/controller/now_playing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../components/custom_header_smart_refresher.dart';
import '../widgets/now_playing_movie_item.dart';

class NowPlayingScreen extends StatefulWidget {
  @override
  NowPlayingScreenState createState() => NowPlayingScreenState();
}

class NowPlayingScreenState extends State<NowPlayingScreen> {
  late NowPlayingController _controller;

  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _controller = Get.find<NowPlayingController>();
    _controller.onRefresh();
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blueAccent,
      elevation: 0,
      centerTitle: false,
      title: const Text(
        'Now Playing',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: GetBuilder<NowPlayingController>(
        builder: (controller) {
          return SmartRefresher(
            controller: _refreshController,
            enablePullUp: _controller.hasMore,
            enablePullDown: true,
            onRefresh: onRefresh,
            onLoading: onLoading,
            header: const CustomHeaderSmartRefresher(),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 9 / 16,
              ),
              itemCount: _controller.movies.length,
              itemBuilder: (context, index) {
                return NowPlayingMovieItem(
                  model: _controller.movies[index],
                );
              },
            ),
          );
        },
      ),
    );
  }


  Future<void> onRefresh() async {
    await _controller.onRefresh();
    _refreshController.refreshCompleted();
  }

  Future<void> onLoading() async {
    await _controller.onLoadMore();
    _refreshController.loadComplete();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
