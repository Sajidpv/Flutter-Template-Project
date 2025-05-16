import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocErrorRetryWidget<T extends Bloc<dynamic, dynamic>, E>
    extends StatelessWidget {
  final String? errorMessage;
  final E retryEvent;

  const BlocErrorRetryWidget({
    super.key,
    required this.retryEvent,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          context.read<T>().add(retryEvent);
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.red.shade50,
            border: Border.all(color: Colors.red),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.refresh, color: Colors.red),
              const SizedBox(height: 8),
              Text(
                errorMessage ?? 'Something went wrong!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                'Tap to retry',
                style: TextStyle(
                  color: Colors.red.shade700,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
