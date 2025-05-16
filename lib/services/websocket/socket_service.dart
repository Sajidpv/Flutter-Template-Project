// import 'package:flutter/foundation.dart';
// import 'package:socket_io_client/socket_io_client.dart' as io;
// import 'package:erp/cors/configs/app_configs.dart';

// class SocketService {
//   static final SocketService _instance = SocketService._internal();
//   factory SocketService() => _instance;
//   SocketService._internal();

//   late io.Socket _socket;

//   bool get isConnected => _socket.connected;

//   void connect(String token, String userId) {
//     _socket = io.io(
//       AppConfig.RAW_BASE_URL,
//       io.OptionBuilder()
//           .setTransports(['websocket'])
//           .enableAutoConnect()
//           .setAuth({'token': token})
//           .build(),
//     );
//     _socket.connect();

//     _socket.onConnect((_) {
//       debugPrint('✅ Connected to socket');
//       _socket.emit('join', userId);
//     });

//     _socket.onConnectError((data) => debugPrint('❌ Connect error: $data'));
//     _socket.onDisconnect((_) => debugPrint('🔌 Socket disconnected'));
//   }

//   void sendEvent(String event, dynamic data) {
//     if (_socket.connected) {
//       _socket.emit(event, data);
//     } else {
//       debugPrint("⚠️ Cannot send event, socket not connected");
//     }
//   }

//   void disconnect() {
//     _socket.disconnect();
//     debugPrint("🛑 Socket disconnected manually");
//   }

//   void on(String event, Function(dynamic) callback) {
//     _socket.on(event, callback);
//   }

//   void off(String event) {
//     _socket.off(event);
//   }
// }
