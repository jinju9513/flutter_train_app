import 'package:flutter/material.dart';
import 'package:flutter_train_app/app_theme.dart';
import 'package:flutter_train_app/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      themeMode: ThemeMode.light,
      home: HomePage(),
      debugShowCheckedModeBanner: false, // 선택사항: 상단 debug 배너 제거
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}

