import 'package:addx_assignment/data/datasources/remote/clients.dart';
import 'package:addx_assignment/domain/repositories/repositories.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'domain/use_cases/user_cases.dart';
import 'features/now_playing/controller/now_playing_controller.dart';

final getIt = GetIt.instance;
late FlutterSecureStorage secureStorage;

void injection() {

  AndroidOptions getAndroidOptions() => const AndroidOptions(encryptedSharedPreferences: true);
  secureStorage = FlutterSecureStorage(aOptions: getAndroidOptions());

  /// Controller
  Get.lazyPut(() => NowPlayingController(getIt()), fenix: true);

  /// Use case
  getIt.registerLazySingleton<MoviesUseCase>(() => MoviesUseCaseImpl(getIt()));

  /// Repository
  getIt.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(getIt()));

  /// Client
  getIt.registerLazySingleton<MoviesClient>(() => MoviesClientImpl());
}
