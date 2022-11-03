import 'package:flutter/material.dart';
import 'package:login_flutter/screen/second.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Login"), 
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondScreen())
            );
            // -- Digunakan untuk mereplace page (tanpa menambah stack page) -- //
            // Navigator.pushReplacement(context, 
            //     MaterialPageRoute(builder: (context) {
            //   return MainPage();
            // }));
          },
        )
      ),
    );
  }
}