import 'package:get_it/get_it.dart';
import 'package:stock_shift_pro/data/network/api_services/base_api_services.dart';
import 'package:stock_shift_pro/data/network/api_services/network_api_services.dart';
import 'package:stock_shift_pro/features/auth/repository/auth_http_api_repository.dart';
import 'package:stock_shift_pro/features/auth/repository/auth_repository.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // Register API Service as a lazy singleton
  locator.registerLazySingleton<BaseApiServices>(() => NetworkApiService());

  // Register AuthRepository with dependency injection
  locator.registerFactory<AuthRepository>(
    () => AuthHttpApiRepository(locator<BaseApiServices>()),
  );

  // Ensure all async dependencies are ready before proceeding
  await locator.allReady();
}
