import 'package:flutter/material.dart';

import 'details.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/home",
      routes: {
    "/home": (context) => MyHomePage(),
    "/details": (context) => Details(),
    },

      home: MyWidget(),
    );
  }
}

enum SingingCharacter { lafayette, jefferson }

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

enum Gender { male, female, other }

class _MyWidgetState extends State<MyWidget> {
  Gender _gender = Gender.male;
  bool kotlin = false;
  bool java = false;
  bool flutter = false;
  bool office = false;
  int gender = 1;
  double current = 40;
  List dev = ["android", "ios"];
  String chosenValue = 'ios';
  bool isSwitched = false;
  var textValue = 'Switch is OFF';
  SingingCharacter? _character = SingingCharacter.lafayette;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('At which skills are you expert in \n'),
            Row(
              children: [
                Text('kotlin'),
                SizedBox(
                  width: 11,
                ),
                Checkbox(
                  value: kotlin,
                  onChanged: ((value) {
                    setState(() {
                      kotlin = value!;
                    });
                  }),
                ),
                SizedBox(
                  width: 11,
                ),
                Text('java'),
                SizedBox(
                  width: 11,
                ),
                Checkbox(
                  value: java,
                  onChanged: ((value) {
                    setState(() {
                      java = value!;
                    });
                  }),
                ),
                SizedBox(
                  width: 11,
                ),
                Text('flutter'),
                SizedBox(
                  width: 11,
                ),
                Checkbox(
                  value: flutter,
                  onChanged: ((value) {
                    setState(() {
                      flutter = value!;
                    });
                  }),
                ),
                SizedBox(
                  width: 11,
                ),
                Text('ms office'),
                SizedBox(
                  width: 11,
                ),
                Checkbox(
                  value: office,
                  onChanged: ((value) {
                    setState(() {
                      office = value!;
                    });
                  }),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text("Your Gender: "),
                ListTile(
                  title: const Text('Male'),
                  leading: Radio(
                    value: Gender.male,
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Female'),
                  leading: Radio(
                    value: Gender.female,
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Other'),
                  leading: Radio(
                    value: Gender.other,
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            Text("Your Percentage: "),
            Slider(
              value: current,
              divisions: 10,
              min: 0,
              max: 100,
              label: current.toString(),
              onChanged: (value) {
                setState(() {
                  current = value;
                });
              },
            ),
            Transform.scale(
                scale: 1,
                child: Switch(
                  onChanged: toggleSwitch,
                  value: isSwitched,
                  activeColor: Colors.blue,
                  activeTrackColor: Colors.yellow,
                  inactiveThumbColor: Colors.redAccent,
                  inactiveTrackColor: Colors.orange,
                )),
            Text(
              '$textValue',
              style: TextStyle(fontSize: 15),
            ),
            Text("Your Favourite Singing Character: "),
            Column(
              children: <Widget>[
                RadioListTile<SingingCharacter>(
                  title: const Text('Lafayette'),
                  value: SingingCharacter.lafayette,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
                RadioListTile<SingingCharacter>(
                  title: const Text('Thomas Jefferson'),
                  value: SingingCharacter.jefferson,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ],
            ),
            DropdownButton(
              value: chosenValue,
              items: dev
                  .map(
                      (e) => DropdownMenuItem<String>(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  chosenValue = value!;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/home");
              },
              child: Text("Button"),
            ),
          ],
        ),
      ),
    );
  }
}
