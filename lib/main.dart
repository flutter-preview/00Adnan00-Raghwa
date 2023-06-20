import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:raghwa/screens/home_screen.dart';
import 'package:raghwa/screens/onboarding_screen.dart';
import 'package:raghwa/widgets/no_internet.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(const [
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: true,
    //   theme: ThemeData(
    //     cupertinoOverrideTheme: const CupertinoThemeData(
    //       textTheme: CupertinoTextThemeData(
    //         primaryColor: Color.fromRGBO(71, 181, 255, 1),
    //         textStyle: TextStyle(
    //           fontFamily: 'Almarai',
    //           color: Colors.black,
    //         ),
    //       ),
    //     ),
    //     fontFamily: 'Almarai',
    //     visualDensity: VisualDensity.standard,
    //     primaryColor: const Color.fromRGBO(71, 181, 255, 1),
    //   ),
    //   home: const OnBoardingScreen(),
    //   builder: (context, child) {
    //     return MediaQuery(
    //       data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
    //       child: Directionality(
    //         textDirection: TextDirection.rtl,
    //         child: child!,
    //       ),
    //     );
    //   },
    // );

    return PlatformProvider(
      //
      // initialPlatform: TargetPlatform.iOS,
      builder: (context) => PlatformTheme(
        cupertinoLightTheme: const CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            primaryColor: Color.fromRGBO(71, 181, 255, 1),
            textStyle: TextStyle(
              fontFamily: 'Almarai',
              color: Colors.black,
            ),
          ),
        ),
        materialLightTheme: ThemeData(
          fontFamily: 'Almarai',
          visualDensity: VisualDensity.standard,
          primaryColor: const Color.fromRGBO(71, 181, 255, 1),
        ),
        themeMode: ThemeMode.light,
        builder: (context) => PlatformApp(
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          title: 'Flutter Platform Widgets',
          debugShowCheckedModeBanner: false,
          home: const OnBoardingScreen(),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: child!,
              ),
            );
          },
        ),
      ),
    );
  }
}
