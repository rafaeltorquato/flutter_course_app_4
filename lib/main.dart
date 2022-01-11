import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './utils/app_colors.dart';
import 'screens/products_overview_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var mySystemTheme = SystemUiOverlayStyle.light.copyWith(
      statusBarColor: AppColors.primary,
      systemNavigationBarColor: AppColors.primary,
      systemNavigationBarIconBrightness: Brightness.light);
  SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyShop',
      theme: ThemeData(
        primarySwatch: AppColors.primary as MaterialColor,
      ),
      home: const ProjectOverviewScreen(),
    );
  }
}
