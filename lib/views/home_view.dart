import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/custom_drawer.dart';
import 'package:food_delivery_app/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: const HomeViewBody(),
      drawer: const CustomDrawer(),
    );
  }
}
