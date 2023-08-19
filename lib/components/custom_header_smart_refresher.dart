import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomHeaderSmartRefresher extends ClassicHeader {
  const CustomHeaderSmartRefresher()
      : super(
          refreshStyle: RefreshStyle.Follow,
          idleIcon: const CupertinoActivityIndicator( color: Colors.black87),
          releaseIcon: const CupertinoActivityIndicator(color: Colors.black87),
          completeIcon: const CupertinoActivityIndicator(color: Colors.black87),
          failedIcon: null,
          completeText: '',
          failedText: '',
          idleText: '',
          releaseText: '',
          refreshingText: '',
        );
}
