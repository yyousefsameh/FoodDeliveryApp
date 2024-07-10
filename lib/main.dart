import 'package:flutter/material.dart';
import 'package:food_delivery_app/manager/restaurant_provider.dart';
import 'package:food_delivery_app/utils/cache_preferences_service.dart';
import 'package:food_delivery_app/utils/theme_provider.dart';
import 'package:food_delivery_app/views/login_view.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheService.initSharedPreferences();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RestaurantProvider(),
        ),
      ],
      child: const FoodApp(),
    ),
  );
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
