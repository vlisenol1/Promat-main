import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promat/_auth/welcome.dart';
import 'package:promat/constant/constant.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Constant.white),
      title: 'Flutter OTP Verification',
      debugShowCheckedModeBanner: false,
      home: const Welcome(),
    );
  }
}
