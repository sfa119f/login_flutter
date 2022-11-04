import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  const User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}

Future<List<User>?> fetchUsers() async {
  try {
    final res = await http.get(Uri.parse('https://reqres.in/api/users'));
    final users = <User>[];

    if (res.statusCode == 200) {
      for (final user in jsonDecode(res.body)['data']) {
        users.add(User.fromJson(user));
      }
      return users;
    } else {
      throw Exception("Failed to load users");
    }
  } catch(e) {
    throw Exception(e.toString());
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFF000000)),
        centerTitle: true,
        title: const Text(
          'Third Screen', 
          style: TextStyle(
            color: Color(0xFF000000), 
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0.5,
      ),
      body:Container( 
        padding: const EdgeInsets.all(20),
        child: const UserListWidget()
      ),
    );
  }
}

class UserListWidget extends StatefulWidget {
  const UserListWidget({super.key});

  @override
  State<UserListWidget> createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {
  late List<User>? users = [
    const User(
      id: 1, 
      email: "george.bluth@reqres.in", 
      firstName: "George", 
      lastName: "Bluth", 
      avatar: "https://reqres.in/img/faces/1-image.jpg"
    ),
    const User(
      id: 2, 
      email: "janet.weaver@reqres.in", 
      firstName: "Janet", 
      lastName: "Weaver", 
      avatar: "https://reqres.in/img/faces/2-image.jpg"
    ),
    const User(
      id: 3, 
      email: "emma.wong@reqres.in", 
      firstName: "Emma", 
      lastName: "Wong", 
      avatar: "https://reqres.in/img/faces/3-image.jpg"
    ),
  ];

  @override
  void initState() {
    super.initState();
    // users = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return users == null || users!.isEmpty
      ? const Center(child: CircularProgressIndicator(),)
      : ListView.builder(
        itemCount: users!.length,
        itemBuilder: (context, index) {
          return InkWell(
          onTap: () {
            Navigator.pop(context, users![index].firstName + ' ' + users![index].lastName);
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.5, color: Color(0xFFE2E3E4)))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: 49,
                  width: 49,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      image: NetworkImage(users![index].avatar),
                      fit: BoxFit.fill,
                    )
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      users![index].firstName + ' ' + users![index].lastName, 
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)
                    ),
                    Text(users![index].email, style: TextStyle(fontSize: 10))
                  ],
                )
              ]
            ),
          ),
        );
        }
      );
  }
}