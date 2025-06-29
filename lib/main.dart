import 'package:flutter/material.dart';
import 'package:islami_route_app/ui/home_screen/home_screen.dart';
import 'package:islami_route_app/ui/intro_screen/intro_screen.dart';
import 'package:islami_route_app/utils/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.introRouteName,
      routes: {
        AppRoutes.introRouteName: (context) => IntroScreen(),
        AppRoutes.homeRouteName: (context) => HomeScreen(),
      },
    );
  }
}
