import 'package:blogapp/features/screens/home/presentasions/page/home_screens.dart';
import 'package:blogapp/utils/config/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Blog app', theme: theme(), home: const HomeScreens());
  }
}
