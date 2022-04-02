import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:lnm/screens/appointment.dart';
import 'package:lnm/screens/get_in_touch.dart';
import 'package:lnm/screens/index.dart';
import 'package:lnm/utils/theme_data.dart';
import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main() {
  runApp(
    EasyDynamicThemeWidget(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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
          '/welcome': (context) => Index(),
          '/home': (context) => HomePage(),
          '/appointments':(context) => Appointment(),
          '/get In touch':(context) => GetInfor(),
        });
  }
}
