import 'package:crashlyticsrec/Pages/HomeScreen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'Helpers/Resources/Styles/Styles.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Styles.lightTheme,
      darkTheme: Styles.darkTheme,
      home: const HomeScreen(extraData: null),
    );
  }
}
