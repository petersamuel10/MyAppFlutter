import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapLocation extends StatefulWidget {
  @override
  _MapLocationState createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  final Map<String, Marker> _markers = {};
  double lat, log;

  void _getLocation() async {
    var currentLocation = await Geolocator()
        .getLastKnownPosition(desiredAccuracy: LocationAccuracy.best);

    setState(() {
      _markers.clear();
      final marker = Marker(
        markerId: MarkerId("curr_loc"),

        position: LatLng(currentLocation.latitude, currentLocation.longitude),
        infoWindow: InfoWindow(title: 'Your Location'),
      );
      lat = currentLocation.latitude;
      log = currentLocation.longitude;
      print("location"+lat.toString());
      _markers["Current Location"] = marker;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, log),
          zoom: 17,
        ),
        markers: _markers.values.toSet(),
      ),
    );
  }
}
