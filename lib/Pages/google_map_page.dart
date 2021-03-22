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
          markerId: MarkerId('ID-1'),
          position: LatLng(22.342127, 91.830522),
          infoWindow: InfoWindow(
              title: "DC Hill Circle,Chattogram",
              snippet: '22.342127, 91.830522')));
    });
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('ID-2'),
          position: LatLng(22.347923, 91.833883),
          infoWindow: InfoWindow(
              title: "Jamal Khan Circle,Chattogram,",
              snippet: "22.347923, 91.833883")));
    });
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('ID-3'),
          position: LatLng(22.342088, 91.836738),
          infoWindow: InfoWindow(
              title: "Anderkilla Circle,Chattogram",
              snippet: "22.342088, 91.836738")));
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
            initialCameraPosition: CameraPosition(
                target: LatLng(22.342088, 91.836738), zoom: 12)));
  }
}
