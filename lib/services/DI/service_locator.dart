import 'package:firebaseapp/utils/local_storage/sqflite_local_db.dart';
import 'package:get_it/get_it.dart';
import 'package:firebaseapp/data/network/api_services/base_api_services.dart';
import 'package:firebaseapp/data/network/api_services/network_api_services.dart';
import 'package:firebaseapp/features/auth/repository/auth_api_repository.dart';
import 'package:firebaseapp/features/auth/repository/auth_repository.dart';
import 'package:firebaseapp/features/auth/view.model/bloc/auth_bloc.dart';
import 'package:firebaseapp/features/user/repository/user_repository.dart';
import 'package:firebaseapp/features/user/view.model/bloc/user_bloc.dart';
// import 'package:firebaseapp/services/websocket/socket_service.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // Register API Service as a lazy singleton
  locator.registerLazySingleton<BaseFirebaseService>(
    () => FirebaseApiService(),
  );

  //Register local db
  locator.registerLazySingleton<SqfliteLocalStorage>(
    () => SqfliteLocalStorage(),
  );
  //Register Bloc with DI
  locator.registerFactory<AuthBloc>(() => AuthBloc(locator<AuthRepository>()));
  locator.registerFactory<UserBloc>(() => UserBloc(locator<UserRepository>()));

  // Register Repository with dependency injection
  locator.registerFactory<AuthRepository>(
    () => AuthApiRepository(
      locator<BaseFirebaseService>(),
      locator<SqfliteLocalStorage>(),
    ),
  );

  // Ensure all async dependencies are ready before proceeding
  await locator.allReady();
}
