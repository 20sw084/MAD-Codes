import 'package:flutter/material.dart';
import 'package:week_4/myhome.dart';

class Details extends StatelessWidget {

  final String data;

  const Details({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Details"),
      ),
      body: Column(
        children: [
          Text("Some Details"),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return MyHomePage();
                  },
                ),
              );
            },
            child: Text(data),
          ),
        ],
      ),
    );
  }
}
