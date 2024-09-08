import 'package:filmora/features/introduction/introduction_page.dart';
import 'package:filmora/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showIntroduction = true;

  @override
  void initState() {
    super.initState();
    _checkIntroductionStatus();
  }

  Future<void> _checkIntroductionStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? canShow = prefs.getBool(Constants.INTRODUCTION_SHOW_KEY) ?? true;
    setState(() {
      _showIntroduction = canShow;
    });
    if (canShow) {
      _disableShowIntroduction();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _showIntroduction ? const IntroductionPage() : const HomePage(),
    );
  }

  void _disableShowIntroduction() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Constants.INTRODUCTION_SHOW_KEY, false);
  }
}
