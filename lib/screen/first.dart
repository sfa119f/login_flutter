import 'package:flutter/material.dart';
import 'package:login_flutter/screen/second.dart';
import 'dart:async';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginWidget(),
    );
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});
  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final nameController = TextEditingController();
  final palindromController = TextEditingController();

  bool isPalindrom() {
    final input = palindromController.text.replaceAll(' ', '');
    bool check = true;
    int i = 0;
    while(check & (i < input.length / 2)) {
      if (input[i] != input[input.length - 1 - i]){
        check = false;
      }
      i+=1;
    }
    return check;
  }

  Future<void> showMyDialog(String title, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void nextPage() {
    if (isPalindrom()){
      String name = nameController.text.toString();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondScreen(name: name))
      );
      nameController.text = '';
      palindromController.text = '';
    } else {
      showMyDialog('Check Palindrom', "Not palindrom.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          children: <Widget>[
            Center(
              child: Container(
                height: 116,
                width: 116,
                margin: const EdgeInsets.only(bottom: 58.12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(58),
                  image: const DecorationImage(
                    image: AssetImage('assets/img/ic_photo.png'),
                    fit: BoxFit.fill,
                  )
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 22.12),
              child: TextField(
                controller: nameController,
                style: const TextStyle(fontSize: 16),
                decoration: const InputDecoration(
                  hintText: 'Name',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 7.94,
                    horizontal: 20
                  ),
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 45),
              child: TextField(
                controller: palindromController,
                style: const TextStyle(fontSize: 16),
                decoration: const InputDecoration(
                  hintText: 'Palindrom',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 7.94,
                    horizontal: 20
                  ),
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2B637B),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.35,
                    horizontal: 85.08,
                  ),
                  textStyle: const TextStyle(fontSize: 14),
                ), 
                onPressed: (){
                  if (palindromController.text.isNotEmpty) {
                    if (isPalindrom()) {
                      showMyDialog('Check Palindrom', 'Is palindrom.');
                    } else {
                      showMyDialog('Check Palindrom', 'Not palindrom.');
                    }
                  } else {
                    showMyDialog('Error', 'Palindrome field not filled.');
                  }
                },
                child: const Text('CHECK'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2B637B),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.35,
                    horizontal: 85.08,
                  ),
                  textStyle: const TextStyle(fontSize: 14)
                  
                ), 
                onPressed: (){
                  if (nameController.text.isEmpty) {
                    showMyDialog('Error', 'Name field not filled');
                  } else if (palindromController.text.isEmpty) {
                    showMyDialog('Error', 'Palindrome field not filled.');
                  } else {
                    nextPage();
                  }
                },
                child: const Text('NEXT'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}