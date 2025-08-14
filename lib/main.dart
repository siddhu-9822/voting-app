import 'package:flutter/material.dart';
import 'package:flutter_vote/screen/home_screen.dart';
import 'package:flutter_vote/screen/login_screen.dart';
import 'package:flutter_vote/screen/profile_screen/profile_screen_i.dart';
import 'package:flutter_vote/screen/result_screen.dart';
import 'package:flutter_vote/screen/sign_up.dart';
import 'package:flutter_vote/screen/splash_screen.dart';
import 'package:flutter_vote/screen/voter_list_screen.dart';
import 'package:flutter_vote/screen/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
    );
  }
}
