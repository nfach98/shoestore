import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shoestore_mobile/core/network/network_info.dart';
import 'package:shoestore_mobile/layer/data/repository/exchanges_repository_impl.dart';
import 'package:shoestore_mobile/layer/data/repository/shoes_repository_impl.dart';
import 'package:shoestore_mobile/layer/data/source/remote/exchanges_remote_data_source.dart';
import 'package:shoestore_mobile/layer/data/source/remote/shoes_remote_data_source.dart';
import 'package:shoestore_mobile/layer/domain/repository/exchanges_repository.dart';
import 'package:shoestore_mobile/layer/domain/repository/shoes_repository.dart';
import 'package:shoestore_mobile/layer/domain/usecase/exchange/get_exchange_usecase.dart';
import 'package:shoestore_mobile/layer/domain/usecase/shoes/get_all_shoes_usecase.dart';
import 'package:shoestore_mobile/layer/domain/usecase/shoes/get_detail_shoes_usecase.dart';
import 'package:shoestore_mobile/layer/presentation/detail/notifier/detail_shoes_notifier.dart';
import 'package:shoestore_mobile/layer/presentation/main/notifier/home_notifier.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ===================== NOTIFIER ========================
  // Home
  sl.registerFactory(() => HomeNotifier(
    allShoesUsecase: sl(),
    exchangeUsecase: sl()
  ));
  sl.registerFactory(() => DetailShoesNotifier(
    detailShoesUsecase: sl()
  ));

  // ===================== USECASE ========================
  // Exchange
  sl.registerLazySingleton(() => GetExchangeUsecase(sl()));

  // Shoes
  sl.registerLazySingleton(() => GetAllShoesUsecase(sl()));
  sl.registerLazySingleton(() => GetDetailShoesUsecase(sl()));

  // ===================== REPOSITORY ========================
  sl.registerLazySingleton<ExchangeRepository>(
    () => ExchangeRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<ShoesRepository>(
    () => ShoesRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // ===================== DATA SOURCE ========================
  sl.registerLazySingleton<ExchangeRemoteDataSource>(
    () => ExchangeRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<ShoesRemoteDataSource>(
    () => ShoesRemoteDataSourceImpl(),
  );

  // ===================== CORE ========================
  // sl.registerLazySingleton(() => CurrencyConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // ===================== EXTERNAL ========================
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Connectivity());
}