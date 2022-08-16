import 'package:get_it/get_it.dart';
import 'package:mobile/module/home/di/dependency.dart';

import 'common/config/dio_config.dart';

final sl = GetIt.instance;

abstract class IconfigureDependencies {
  inject();

  injectDataSource();

  injectRepository();

  injectNotifier();

  injectUseCase();
}

Future configureDependencies() async {
  sl.registerLazySingleton(() => createDio());
  InjectDependencyHome().inject();
}
