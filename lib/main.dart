// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:todolist/views/home_view.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomeView(),
        });
  }
}