import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _scale = 1.0;
  double _previousScale = 1.0;
  Offset offset = const Offset(0.0, 0.0);
  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: GestureDetector(
  //       onPanUpdate: (details) {
  //         setState(() {
  //           offset = Offset(
  //               offset.dx + details.delta.dx, offset.dy + details.delta.dy); //
  //         });
  //       },
  //       child: Center(
  //         child: Transform.translate(
  //           offset: offset,
  //           child: Container(
  //             height: 300,
  //             width: 300,
  //             color: Colors.blue,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: GestureDetector(
          // onTap: () {
          //   log("onTap");
          // },
          // onDoubleTap: () {
          //   log("onDoubleTap");
          // },
          // onLongPress: () {
          //   log("onLongPress");
          // },
          // onVerticalDragUpdate: (details) {
          //   print('onVerticalDragUpdate: ${details.localPosition.dy}');
          // },
          onScaleStart: (details) {
            _previousScale = _scale;
          },
          // onScaleUpdate: (details) {
          //   setState(() {
          //     _scale = _previousScale * details.scale;
          //   });
          //   print('onScaleUpdate: $_scale');
          // },
          onScaleUpdate: (details) {
            setState(() {
              _scale = details.scale;
            });
          },
          // onScaleEnd: (details) {
          //   setState(() {
          //     _scale = 1.0;
          //   }); //Return to the original size
          // },
          child: Center(
            child: Transform.scale(
              scale: _scale,
              child: Container(height: 300, width: 300, color: Colors.blue),
            ),
          ),
        ),
      ),
    );
  }
}
