import 'package:covid_app/model/general.dart';
import 'package:covid_app/view/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: HexColor("#ededed"), primarySwatch: Colors.orange),
      color: HexColor("#f2f3f9"),
      home: MainPage(),
    );
  }
}
