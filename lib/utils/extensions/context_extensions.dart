import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_shift_pro/features/auth/view.model/bloc/auth_bloc.dart';

extension BlocExtensions on BuildContext {
  AuthBloc get authBloc => BlocProvider.of<AuthBloc>(this);
}
