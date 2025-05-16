import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_shift_pro/cors/widgets/state_management/bloc/file_picker_bloc.dart';
import 'package:stock_shift_pro/cors/widgets/state_management/cubit/theme_cubit.dart';
import 'package:stock_shift_pro/features/auth/view.model/bloc/auth_bloc.dart';

import 'package:stock_shift_pro/services/DI/service_locator.dart';

class BlocProviders extends StatelessWidget {
  final Widget child;
  const BlocProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => FilePickerBloc()),
        BlocProvider(
          create: (context) {
            return AuthBloc(locator.get())..add(AppStartedEvent());
          },
        ),
      ],
      child: child,
    );
  }
}
