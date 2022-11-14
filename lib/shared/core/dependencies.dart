import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:semana_api/controller/controller.dart';
import 'package:semana_api/service/login_service.dart';
import 'package:semana_api/service/shared_preference.dart';
import 'package:semana_api/shared/client/dio_implement.dart';

final getIt = GetIt.instance;

void initializeDependencies() {
  getIt.registerFactory<Dio>(
    () => Dio(),
  );

  getIt.registerFactory<DioClientImplement>(
    () => DioClientImplement(client: getIt<Dio>()),
  );

  getIt.registerFactory<SharedPreferenceTest>(
    () => SharedPreferenceTest(),
  );

  getIt.registerFactory<GetDataRepoService>(
      () => GetDataRepoService(client: getIt<DioClientImplement>()));

  getIt.registerFactory<Controller>(() => Controller(
        localStorageService: getIt<SharedPreferenceTest>(),
        remoteService: getIt<GetDataRepoService>(),
      ));
}
