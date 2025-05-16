// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:erp/features/user/view.model/bloc/user_bloc.dart';
// import 'package:erp/services/websocket/socket_service.dart';

// /// Central manager that listens for real-time socket events
// /// and dispatches corresponding BLoC events.
// class SocketEventDispatcher {
//   final BuildContext context;
//   final SocketService socketService;

//   SocketEventDispatcher({required this.context, required this.socketService});

//   /// Initializes all event listeners
//   void init() {
//     _listenForNewOrderUpdates();
//     _listenForOrderUpdates();
//     _listenForEntryUpdates();
//     _listenForNewUserUpdates();
//     _listenForUserStatusUpdates();
//   }

//   void _listenForNewOrderUpdates() {
//     socketService.on('newOrder', (data) {
//       context.read<SalesOrderBloc>().add(LoadSalesOrderEvent());
//     });
//   }

//   void _listenForEntryUpdates() {
//     socketService.on('stockEntryUpdate', (data) {
//       context.read<EntryBloc>().add(LoadEntryEvent());
//     });
//   }

//   void _listenForOrderUpdates() {
//     socketService.on('orderUpdate', (data) {
//       context.read<SalesOrderBloc>().add(LoadSalesOrderEvent());
//     });
//   }

//   void _listenForNewUserUpdates() {
//     socketService.on('newUserUpdate', (data) {
//       context.read<UserBloc>().add(GetMyUsersEvent());
//     });
//   }

//   void _listenForUserStatusUpdates() {
//     socketService.on('userRequestUpdate', (data) {
//       context.read<UserBloc>().add(GetMyUsersEvent());
//     });
//   }

//   /// Unsubscribes from all socket events
//   void dispose() {
//     socketService.off('newOrder');
//     socketService.off('stockEntryUpdate');
//     socketService.off('orderUpdate');
//     socketService.off('newUserUpdate');
//     socketService.off('userRequestUpdate');
//   }
// }
