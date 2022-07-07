import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:user_suitmedia_test/features/profiles/data/remote/api_contracts.dart';
import 'package:user_suitmedia_test/features/profiles/data/repository/user_repository.dart';
import 'package:user_suitmedia_test/features/profiles/domain/repository/i_user_repository.dart';

final injector = GetIt.instance;

class AppModule {
  static void inject() {
    injector.registerSingleton<BaseOptions>(
      BaseOptions(baseUrl: ApiContracts.baseURL),
    );
    injector.registerLazySingleton<Dio>(
      () => Dio(injector.get<BaseOptions>()),
    );

    injector.registerLazySingleton<IUserRepository>(
      () => UserRepository(dio: injector.get<Dio>()),
    );
  }
}
