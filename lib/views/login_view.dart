import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: const LoginViewBody(),
    );
  }
}
