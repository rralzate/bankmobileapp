import 'package:bank_app/core/network/network_info.dart';
import 'package:bank_app/features/credit/data/datasources/user_local_datasource.dart';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/util/input_converter.dart';
import 'features/credit/data/datasources/calification_remote_datasource.dart';
import 'features/credit/data/repositories/credit_repository_impl.dart';
import 'features/credit/domain/repositories/credit_repository.dart';
import 'features/credit/domain/usescases/get_central_riesgo.dart';
import 'features/credit/domain/usescases/set_credit.dart';
import 'features/credit/presentation/bloc/blocs.dart';
//import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Credit Bank
  // Bloc
  sl.registerFactory(
    () => CreditUserBloc(
      getCentralRiesgo: sl(),
      setCredit: sl(),
    ),
  );

  // sl.registerFactory(
  //   () => UserBloc(),
  // );
  // Use cases
  sl.registerLazySingleton(() => GetCentralRiesgo(sl()));
  sl.registerLazySingleton(() => SetCredit(sl()));

  // Repository
  sl.registerLazySingleton<CreditReposiroty>(
    () => CreditRepositoryImpl(
      calificationRemoteDataSource: sl(),
      userLocalDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<CalificationRemoteDataSource>(
    () => CalificationRemoteDataSourceImpl(dioValidateUser: sl()),
  );

  sl.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
