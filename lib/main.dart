import 'package:flutter/material.dart';
import 'package:login_flutter/screen/first.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: FirstScreen(),
    );
  }
}