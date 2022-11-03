import 'package:flutter/material.dart';
import 'package:login_flutter/screen/second.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List User Page")),
      body: Center(
        child: ElevatedButton(
          child: Text("Select User"), 
          onPressed: () {
            Navigator.of(context).pop();
          }
        )
      ),
    );
  }
}