import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final FlutterErrorDetails errorDetails;
  const CustomErrorWidget({super.key, required this.errorDetails});

  @override
  Widget build(BuildContext context) {
    debugPrint(errorDetails.stack.toString());
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset('assets/images/error.png'),
              Text(
                kDebugMode
                    ? errorDetails.summary.toString()
                    : 'Oops! Something went wrong!',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
