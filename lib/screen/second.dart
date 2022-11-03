import 'package:flutter/material.dart';
import 'package:login_flutter/screen/third.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main Page")),
      body: Center(
        child: ElevatedButton(
          child: Text("To Second Page"), 
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ThirdScreen())
            );
          },
        )
      ),
    );
  }
}