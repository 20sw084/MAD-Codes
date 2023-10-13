import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  Position? _currentPosition;
  String? _currentAddress;

  Future<bool> _handlePermission() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        debugPrint("Permission Denied");
        return false;
      }
      if (permission == LocationPermission.deniedForever) {
        debugPrint("Permission Denied! Change Settings");
        return false;
      }
    }
    return true;
  }

  _getCurrentLocation() async {
    final hasPermission = await _handlePermission();
    if (!hasPermission) return;
    try {
      final position = await Geolocator.getCurrentPosition();
      setState(() {
        _currentPosition = position;
      });
      log(_currentPosition.toString());
      _addressFromCoordinates(_currentPosition!);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  _addressFromCoordinates(Position position) async {
    List<Placemark> places = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    final place = places[0];
    setState(() {
      _currentAddress =
      "${place.name}, ${place.street}, ${place.locality}, ${place.country}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('LAT: ${_currentPosition?.latitude ?? "No Latitude as of now"}'),
            Text('LNG: ${_currentPosition?.longitude ?? "No Longitude as of now"}'),
            Text('ADDRESS: ${_currentAddress ?? "No address as of now"}'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _getCurrentLocation,
              child: const Text("Get Current Location"),
            )
          ],
        ),
      ),
    );
  }
}

// 1. Open the AndroidManifest.xml file in your Android project's android/app/src/main directory.
// 2. Inside the <manifest> element, add the following lines to request location permissions:
// <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
// <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />