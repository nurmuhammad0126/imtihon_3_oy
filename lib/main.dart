import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'views/splash_screen/screen/splash_1_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return AdaptiveTheme(
          light: ThemeData.light(),
          dark: ThemeData.dark(),
          initial: AdaptiveThemeMode.system,
          builder: (context, theme) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme,
                
              
              home: const Splash1Screen(),
            );
          },
        );
      },
    );
  }
}
