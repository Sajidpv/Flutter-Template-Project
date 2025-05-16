import 'package:get_it/get_it.dart';
import 'package:stock_shift_pro/data/network/api_services/base_api_services.dart';
import 'package:stock_shift_pro/data/network/api_services/network_api_services.dart';
import 'package:stock_shift_pro/features/auth/repository/auth_http_api_repository.dart';
import 'package:stock_shift_pro/features/auth/repository/auth_repository.dart';
import 'package:stock_shift_pro/features/auth/view.model/bloc/auth_bloc.dart';
import 'package:stock_shift_pro/features/user/repository/user_repository.dart';
import 'package:stock_shift_pro/features/user/view.model/bloc/user_bloc.dart';
// import 'package:stock_shift_pro/services/websocket/socket_service.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // Register API Service as a lazy singleton
  locator.registerLazySingleton<BaseApiServices>(() => NetworkApiService());

  //Register Web socket service as lazy singleton
  // locator.registerLazySingleton<SocketService>(() => SocketService());

  //Register Bloc with DI
  locator.registerFactory<AuthBloc>(() => AuthBloc(locator<AuthRepository>()));
  locator.registerFactory<UserBloc>(() => UserBloc(locator<UserRepository>()));

  // Register Repository with dependency injection
  locator.registerFactory<AuthRepository>(
    () => AuthHttpApiRepository(locator<BaseApiServices>()),
  );

  // Ensure all async dependencies are ready before proceeding
  await locator.allReady();
}
