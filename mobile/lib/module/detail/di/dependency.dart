import 'package:mobile/injection_container.dart';
import 'package:mobile/module/detail/data/datasources/detail_remote_data_source.dart';
import 'package:mobile/module/detail/data/repositories/detail_repository_impl.dart';
import 'package:mobile/module/detail/domain/repositories/detail_repository.dart';
import 'package:mobile/module/detail/domain/usecases/get_shoes_detail_usecase.dart';
import 'package:mobile/module/detail/presentation/notifier/detail_notifier.dart';

class InjectDependencyDetail extends IconfigureDependencies {
  @override
  inject() {
    injectNotifier();
    injectDataSource();
    injectRepository();
    injectUseCase();
  }

  @override
  injectNotifier() {
    sl.registerFactory(() => DetailNotifier(getShoesDetailUsecase: sl()));
  }

  @override
  injectDataSource() {
    sl.registerLazySingleton<DetailRemoteDataSource>(
        () => DetailRemoteDataSourceImpl(sl()));
  }

  @override
  injectRepository() {
    sl.registerLazySingleton<DetailRepository>(
        () => DetailRepositoryImpl(sl()));
  }

  @override
  injectUseCase() {
    sl.registerLazySingleton(() => GetShoesDetailUsecase(sl()));
  }
}
