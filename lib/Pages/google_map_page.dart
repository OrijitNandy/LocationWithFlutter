import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  @override
  _GoogleMapPageState createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  Map<MarkerId, Marker> markers = {};
  List listMarkerIds = List.filled(500, 0, growable: true);
  static final LatLng _center = const LatLng(22.342088, 91.836738);

  void _onMapCreated(GoogleMapController controller) {
    MarkerId markerId1 = MarkerId("1");
    MarkerId markerId2 = MarkerId("2");
    MarkerId markerId3 = MarkerId("3");

    listMarkerIds.add(markerId1);
    listMarkerIds.add(markerId2);
    listMarkerIds.add(markerId3);
    Marker marker1 = Marker(
        markerId: markerId1,
        position: LatLng(22.348002, 91.833913),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow: InfoWindow(
            title: "Jamal Khan Circle", snippet: "22.348002, 91.833913"));
    Marker marker2 = Marker(
      markerId: markerId2,
      position: LatLng(22.342162, 91.830539),
      infoWindow:
          InfoWindow(title: "DC Hill Circle", snippet: "22.342162, 91.830539"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    );
    Marker marker3 = Marker(
        markerId: markerId3,
        position: LatLng(22.342117, 91.836728),
        infoWindow: InfoWindow(
            title: "Anderkilla Circle", snippet: "22.342117, 91.836728"));
    setState(() {
      markers[markerId1] = marker1;
      markers[markerId2] = marker2;
      markers[markerId3] = marker3;
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
            markers: Set.of(markers.values),
            initialCameraPosition:
                CameraPosition(target: _center, zoom: 12.toDouble())));
  }
}
