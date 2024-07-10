import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: const SignUpViewBody(),
    );
  }
}
