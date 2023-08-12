import 'package:flutter/material.dart';
import 'package:week_5/show_details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _dropdownValue = 'Male';
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _fKey = GlobalKey<FormState>();
    TextEditingController _unameTextEditingController = TextEditingController();
    TextEditingController _passTextEditingController = TextEditingController();
    TextEditingController _emailTextEditingController = TextEditingController();
    TextEditingController _dobTextEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form"),
      ),
      body: Column(
        children: [
          Form(
            key: _fKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _unameTextEditingController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Provide some username";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Username",
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  controller: _passTextEditingController,
                  validator: (value) {
                    RegExp _regex = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    if (value!.isEmpty) {
                      return "Provide the Password.";
                    } else {
                      if (!_regex.hasMatch(value)) {
                        return "Enter valid password";
                      }
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                ),
                TextFormField(
                  controller: _emailTextEditingController,
                  validator: (value) {
                    RegExp _reg = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                    if (value!.isEmpty) {
                      return "Provide the Email.";
                    } else {
                      if (!_reg.hasMatch(value)) {
                        return "Enter valid Email";
                      }
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                ),
                TextFormField(
                  controller: _dobTextEditingController,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 1) {
                      return 'Choose Date';
                    }
                  },
                  // onTap: () async {
                  //   DateTime? date = DateTime(1900);
                  //   // FocusScope.of(context).requestFocus(
                  //   //   new FocusNode(),
                  //   // );
                  //   date = await showDatePicker(
                  //     context: context,
                  //     initialDate: DateTime.now(),
                  //     firstDate: DateTime(1900),
                  //     lastDate: DateTime(2100),
                  //   );
                  //   if (date != null) {
                  //     setState(() {
                  //       _dobTextEditingController.text = date!.toString();
                  //     });
                  //   }
                  // },
                  onTap: () async {
                      // FocusScope.of(context).requestFocus(
                      //   new FocusNode(),
                      // );
                    await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2025),
                    ).then((selectedDate) {
                      if (selectedDate != null) {
                        _dobTextEditingController.text = selectedDate.toString().split(" ").first;
                      }
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "D.O.B",
                  ),
                ),
                DropdownButton<String>(
                  value: _dropdownValue,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Male', 'Female', 'Not Prefer to say']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),

              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_fKey.currentState!.validate()) {
                _fKey.currentState!.save();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ShowDetails(
                      uName: _unameTextEditingController.text,
                      pass: _passTextEditingController.text,
                      email: _emailTextEditingController.text,
                      dob: _dobTextEditingController.text,
                      gender: _dropdownValue,
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Something went wrong"),
                  ),
                );
              }
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}
