import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zag_nights/data/network/firebase_factory.dart';
import 'package:zag_nights/domain/usecase/app_status_usecase.dart';

import '../data/data_source/cache_data_source.dart';
import '../data/data_source/local_data_source.dart';
import '../data/data_source/remote_data_source.dart';
import '../data/data_source/runtime_data_source.dart';
import '../data/network/app_api.dart';
import '../data/network/app_prefs.dart';
import '../data/network/assets_loader.dart';
import '../data/network/dio_factory.dart';
import '../data/network/network_info.dart';
import '../data/repository/repository_impl.dart';
import '../domain/repository/repository.dart';
import 'date_ntp.dart';

final sl = GetIt.instance;

Future<void> initAppModule() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<DateNTP>(() => DateNTPImpl());
  sl.registerLazySingleton<AppPrefs>(() => AppPrefsImpl(sharedPreferences));

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnection()));

  // sl.registerLazySingleton<GSheetFactory>(() => GSheetFactoryImpl());

  sl.registerLazySingleton<AssetsLoader>(() => AssetsLoaderImpl());
  var dio = await DioFactory().getDio();
  sl.registerLazySingleton<Dio>(() => dio);
  var firestore = await FirestoreFactoryImpl().create();
  sl.registerLazySingleton<FirebaseFirestore>(() => firestore);
  sl.registerLazySingleton<AppServiceClient>(() => AppServiceClientImpl(sl()));
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<RuntimeDataSource>(() => RuntimeDataSourceImpl());
  sl.registerLazySingleton<CacheDataSource>(
    () => CacheDataSourceImpl(sl(), sl()),
  );

  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(sl()));

  sl.registerLazySingleton<Repository>(
      () => RepositoryImpl(sl(), sl()));
}

void initHomeScreen() {
  if (GetIt.instance.isRegistered<AppStatusUseCase>() == false) {
    sl.registerFactory<AppStatusUseCase>(() => AppStatusUseCase(sl()));
  }
}
