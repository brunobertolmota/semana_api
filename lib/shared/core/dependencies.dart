import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:semana_api/controller/controller.dart';
import 'package:semana_api/service/login_service.dart';
import 'package:semana_api/service/shared_preference.dart';
import 'package:semana_api/shared/client/cache_client.dart';
import 'package:semana_api/shared/client/client.dart';
import 'package:semana_api/shared/client/dio_implement.dart';

final getIt = GetIt.instance;

void initializeDependencies() {
  getIt.registerFactory<Dio>(
    //pode ser adicionado varias opcoes ao dio
    () => Dio(),
  );

  getIt.registerFactory<DioClientImpl>(
    () => DioClientImpl(
      client: getIt<Dio>(),
    ),
  );

  getIt.registerFactory<SharedPreferenceTestImpl>(
    () => SharedPreferenceTestImpl(),
  );

  getIt.registerFactory<GetDataRepoService>(
    () => GetDataRepoService(
      client: getIt<DioClientImpl>(),
    ),
  );

  //pode ser feito um singleton
  getIt.registerFactory<Controller>(
    () => Controller(
      remoteService: getIt<GetDataRepoService>(),
      localStorageService: getIt<SharedPreferenceTestImpl>(),
    ),
  );
}
