import 'package:flutter/material.dart';
import 'package:login_flutter/screen/third.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFF000000)),
        centerTitle: true,
        title: const Text(
          'Second Screen', 
          style: TextStyle(
            color: Color(0xFF000000), 
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0.5,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 13),
            padding: const EdgeInsets.only(top: 12),
            child: const Text(
              'Welcome',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
          UsernameWidget(username: name),
          Container(
            height: (MediaQuery.of(context).size.height) - 220,
            child: const Center(
              child: Text(
                'Selected User Name',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2B637B),
                padding: const EdgeInsets.symmetric(
                  vertical: 12.35,
                  horizontal: 85.08,
                ),
                textStyle: const TextStyle(fontSize: 14),
              ), 
              child: const Text("Choose a User"), 
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdScreen())
                );
              },
            )
          )
        ],
      ),
    );
  }
}

class UsernameWidget extends StatefulWidget {
  const UsernameWidget({super.key, required this.username});
  final String username;

  @override
  State<UsernameWidget> createState() => _UsernameWidgetState();
}

class _UsernameWidgetState extends State<UsernameWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.username,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    );
  }
}