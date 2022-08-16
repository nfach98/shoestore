import 'package:mobile/injection_container.dart';
import 'package:mobile/module/home/data/datasources/home_remote_data_source.dart';
import 'package:mobile/module/home/data/repositories/home_repository_impl.dart';
import 'package:mobile/module/home/domain/repositories/home_repository.dart';
import 'package:mobile/module/home/domain/usecases/get_shoes_usecase.dart';
import 'package:mobile/module/home/presentation/notifier/home_notifier.dart';

class InjectDependencyHome extends IconfigureDependencies {
  @override
  inject() {
    injectNotifier();
    injectDataSource();
    injectRepository();
    injectUseCase();
  }

  @override
  injectNotifier() {
    sl.registerFactory(() => HomeNotifier(getShoesUsecase: sl()));
  }

  @override
  injectDataSource() {
    sl.registerLazySingleton<HomeRemoteDataSource>(
        () => HomeRemoteDataSourceImpl(sl()));
  }

  @override
  injectRepository() {
    sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));
  }

  @override
  injectUseCase() {
    sl.registerLazySingleton(() => GetShoesUsecase(sl()));
  }
}
