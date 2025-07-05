import 'package:flutter/material.dart';
import 'package:islami_route_app/providers/most_recent_provider.dart';
import 'package:islami_route_app/tabs/quran_tab/sura_details_screen.dart';
import 'package:islami_route_app/ui/home_screen/home_screen.dart';
import 'package:islami_route_app/ui/intro_screen/intro_screen.dart';
import 'package:islami_route_app/utils/app_routes.dart';
import 'package:islami_route_app/utils/app_themes.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MostRecentProvider(),
      child: MyApp()));
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
        AppRoutes.suraDetailsScreenRouteName: (context) => SuraDetailsScreen(),
      },
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
