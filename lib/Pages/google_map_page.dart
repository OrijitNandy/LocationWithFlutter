import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  @override
  _GoogleMapPageState createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  Set<Marker> _markers = {};
  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('ID-1'), position: LatLng(22.3569, 91.7832)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Google Map"),
        ),
        body: GoogleMap(
            onMapCreated: _onMapCreated,
            markers: _markers,
            initialCameraPosition:
                CameraPosition(target: LatLng(22.3569, 91.7832), zoom: 15)));
  }
}
