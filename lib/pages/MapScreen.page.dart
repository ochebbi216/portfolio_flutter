import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = LatLng(34.84118753686387, 10.755166617924118);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    // Access the current theme data
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Emplacement de l'IIT"),
        // Use the theme's primary color for the AppBar
        backgroundColor: Colors.deepPurple,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 18.0,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('someId'),
            position: _center,
            infoWindow: const InfoWindow(title: 'IIT', snippet: 'Institut International de Technologies de Sfax'),
          ),
        },
      ),
    );
  }
}
