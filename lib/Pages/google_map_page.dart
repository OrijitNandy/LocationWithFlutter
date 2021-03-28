import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  @override
  _GoogleMapPageState createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  List listMarkerIds = List.filled(500, 0, growable: true);
  static final LatLng _center = const LatLng(22.342088, 91.836738);

  void _onMapCreated(GoogleMapController controller) {
    int generateIds() {
      var rng = new Random();
      var randomInt;
      randomInt = rng.nextInt(100);
      print(rng.nextInt(100));
      return randomInt;
    }

    buildMarker() {
      var gridItem;
      for (var i = 0; i < gridItem.location.length; i++) {
        var markerIdVal = generateIds();
        final MarkerId markerId = MarkerId(markerIdVal.toString());
        final Marker marker = Marker(
            markerId: markerId,
            position: LatLng(gridItem.locations[i].latitude,
                gridItem.locations[i].longitude),
            infoWindow: InfoWindow(
                title: gridItem.locations[i].place,
                snippet: gridItem.locations[i].region));
        setState(() {
          markers[markerId] = marker;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Google Map"),
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          markers: Set.of(markers.values),
          initialCameraPosition: CameraPosition(target: _center, zoom: 12),
        ));
  }
}
