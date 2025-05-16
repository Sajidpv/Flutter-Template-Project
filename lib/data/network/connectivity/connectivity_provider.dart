import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:erp/main.dart';
import 'package:erp/routes/route_names.dart';

class ConnectivityProvider extends ChangeNotifier {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivitySubscription;
  bool _connected = true;
  bool get connected => _connected;
  ConnectivityProvider() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      if (results.contains(ConnectivityResult.none)) {
        _connected = false;
      } else {
        navigatorKey.currentState?.popUntil(
          (route) => route.settings.name != RoutesName.no_route,
        );
        _connected = true;
      }

      notifyListeners();
    });
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    super.dispose();
  }
}
