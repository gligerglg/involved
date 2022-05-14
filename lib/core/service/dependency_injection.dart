import 'package:connectivity/connectivity.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/data/datasources/local_data_source.dart';
import '../../features/data/datasources/remote_data_source.dart';
import '../../features/data/datasources/shared_preference.dart';
import '../../features/data/repositories/repository_impl.dart';
import '../../features/domain/repositories/repository.dart';
import '../../features/presentation/bloc/post/post_bloc.dart';
import '../network/api_helper.dart';
import '../network/network_info.dart';

final injection = GetIt.instance;

Future<void> setupLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  injection.registerLazySingleton(() => sharedPreferences);
  injection.registerSingleton(AppSharedData(injection()));

  injection.registerLazySingleton<APIHelper>(() => APIHelper());
  injection
      .registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(injection()));
  injection.registerLazySingleton(() => Connectivity());

  ///Repository
  injection.registerLazySingleton<Repository>(
    () => RepositoryImpl(
        remoteDataSource: injection(),
        localDataSource: injection(),
        networkInfo: injection()),
  );

  ///Data sources
  injection.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(apiHelper: injection()),
  );
  injection.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(sharedPreferences: injection()),
  );

  ///Blocs
  injection.registerFactory(
    () => PostBloc(),
  );
}
