import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new),
        title: Text("Club President Profile"),
      ),
      body: Column(
        children: [
          CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('asset/images/avatar2.png'),
          ),
        ],
      ),
    );
  }
}
