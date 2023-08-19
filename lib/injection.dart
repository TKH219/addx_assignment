import 'package:addx_assignment/data/datasources/remote/clients.dart';
import 'package:addx_assignment/domain/repositories/repositories.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'domain/use_cases/user_cases.dart';

final getIt = GetIt.instance;

void injection() {

  /// Controller

  /// Use case
  getIt.registerLazySingleton<MoviesUseCase>(() => MoviesUseCaseImpl(getIt()));

  /// Repository
  getIt.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(getIt()));

  /// Client
  getIt.registerLazySingleton<MoviesClient>(() => MoviesClientImpl());
}
