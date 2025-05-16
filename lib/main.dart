import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stock_shift_pro/cors/configs/app_strings.dart';
import 'package:stock_shift_pro/cors/widgets/state_management/cubit/theme_cubit.dart';
import 'package:stock_shift_pro/features/auth/view.model/bloc/auth_bloc.dart';
import 'package:stock_shift_pro/routes/route_names.dart';
import 'package:stock_shift_pro/routes/routes.dart';
import 'package:stock_shift_pro/services/bloc/bloc_observers.dart';
import 'package:stock_shift_pro/services/bloc/bloc_providers.dart';
import 'package:stock_shift_pro/services/firebase/firebase_options.dart';
import 'package:stock_shift_pro/services/firebase/firebase_push_notification_service.dart';
import 'package:stock_shift_pro/services/DI/service_locator.dart';
import 'package:stock_shift_pro/utils/exceptions/custom_error_handling_widget.dart';
import 'package:stock_shift_pro/utils/theme/theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  // // Memory leak detection toolkit
  //debugProfilePlatformChannels = true; // Tracks platform channel usage
  // Track widget creation/destruction
  // FlutterError.onError = (FlutterErrorDetails details) {
  //   // Custom error handling to catch memory-related issues (details.exception.toString().contains( 'memory') ||
  //   if (details.exception.toString().contains('memory') ||
  //       details.exception.toString().contains('dispose')) {
  //     if (kDebugMode) {
  //       print('* POTENTIAL MEMORY LEAK: ${details.exception}');
  //       print(' • CONTEXT: ${details.context}');
  //       print(' ° STACK TRACE: ${details.stack}');
  //     }
  //   }
  //   // Forward to normal error handling
  //   FlutterError.presentError(details);
  // };
  WidgetsFlutterBinding.ensureInitialized();
  //Init firebase with options
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await PushNotificationService().init();

  /// initialize hydrated bloc
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory(
              (await getApplicationDocumentsDirectory()).path,
            ),
  );

  // Setup Service Locator
  await setupLocator();

  Bloc.observer = MyBlocObserver();
  // // Enable memory statistics logging
  // if (kDebugMode) {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     printMemoryUsage();
  //   });
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProviders(
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        buildWhen: (previous, current) => current != previous,
        builder: (context, ThemeMode mode) {
          return BlocListener<AuthBloc, AuthState>(
            listenWhen: (prev, curr) => curr is AuthenticatedState,
            listener: (context, state) {
              // if (state is AuthenticatedState) {
              //   final socketService = locator<SocketService>();
              //   socketService.connect(
              //     SessionController().token ?? '',
              //     SessionController().user?.sId.toString() ?? '',
              //   );
              //   final dispatcher = SocketEventDispatcher(
              //     context: context,
              //     socketService: socketService,
              //   );
              //   dispatcher.init();
              // }
            },
            child: MaterialApp(
              navigatorKey: navigatorKey,
              builder: (context, child) {
                ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                  return CustomErrorWidget(errorDetails: errorDetails);
                };
                return child ?? const SizedBox.shrink();
              },
              title: AppStrings.appTitle,
              themeMode: mode,
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: Routes.generateRoute,
              initialRoute: RoutesName.splash,
            ),
          );
        },
      ),
    );
  }
}

// Helper function to periodically check memory usage
// void printMemoryUsage() {
//   debugPrint(
//     '™ Current memory usage: ${(ProcessInfo.currentRss / 1024 / 1024).toStringAsFixed(2)}MB',
//   );
//   Future.delayed(Duration(seconds: 5), printMemoryUsage);
// }
