import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

// add this in androidManifest.xml(after line 5)
        // <meta-data android:name="com.google.android.geo.API_KEY"
        //     android:value="AIzaSyDqIKgp0PFBw8Yp-SlXh1_8YABQ4Jd3Km"/>

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
  late GoogleMapController _mapController;

  _handleTap(LatLng point) {
    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: point, zoom: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: GoogleMap(
          onTap: (argument) {
            _handleTap(argument);
          },
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          onMapCreated: (controller) {
            _mapController = controller;
          },
          initialCameraPosition: const CameraPosition(
            target: LatLng(37.4279, -122.0888),
            zoom: 12,
          ),
          markers: {
            const Marker(
              markerId: MarkerId("My-Marker"),
              icon: BitmapDescriptor.defaultMarker,
              position: LatLng(37.4279, -122.0888),
              infoWindow: InfoWindow(title: "My Marker"),
            )
          },
        ),
      ),
    );
  }
}

// End of class c
