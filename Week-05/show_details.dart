import 'package:flutter/material.dart';

class ShowDetails extends StatelessWidget {
  final String uName;
  final String pass;
  final String email;
  final String dob;
  final String gender;
  const ShowDetails({
    super.key,
    required this.uName,
    required this.pass,
    required this.email,
    required this.dob,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Details"),
      ),
      body: Column(
        children: [
          Text(uName),
          Text(pass),
          Text(email),
          Text(dob),
          Text(gender),
        ],
      ),
    );
  }
}
