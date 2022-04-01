import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:lnm/screens/aboutus.dart';
import 'package:lnm/utils/theme_data.dart';
import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main() {
  runApp(
    EasyDynamicThemeWidget(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'LNM',
        theme: lightThemeData,
        darkTheme: darkThemeData,
        debugShowCheckedModeBanner: false,
        themeMode: EasyDynamicTheme.of(context).themeMode,
        initialRoute: '/welcome',
        routes: {
          '/welcome': (context) => HomePage(),
          '/About Us': (context) => AboutUs()
        });
  }
}
