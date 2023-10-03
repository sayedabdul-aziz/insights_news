import 'package:flutter/material.dart';
import 'package:insights_news/core/app_color.dart';
import 'package:insights_news/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Insights News',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.backgroundColor,
      ),
      home: const SplashView(),
    );
  }
}
