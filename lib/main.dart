// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App UI',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      // home: HomeScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/discover': (context) => DiscoverScreen(),
        '/article': (context) => ArticleScreen()
      },
    );
  }
}
