import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:firebaseapp/cors/widgets/buttons/material_button.dart';
import 'package:firebaseapp/features/auth/view.model/services/session_services.dart';
import 'package:flutter/material.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Image.asset('assets/verified.jpg', height: 300),

              Text(
                textAlign: TextAlign.center,
                'Verification',
                style: context.titleLarge,
              ),

              Center(
                child: RichText(
                  text: TextSpan(
                    text:
                        'We\'ve send a verification code to the \nEmail ', // First text
                    style: context.bodyMedium,
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            '  ${SessionController().user?.email}', // Second text

                        style: context.bodyLarge,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              MaterialButtonWidget(title: 'Continue', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
