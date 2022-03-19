import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

// SizedBox(
//   height: context.height * .3,
//   width: context.width * .9,
//   child: GoogleMap(
//     // ignore: prefer_collection_literals
//     markers: Set<Marker>.of(
//       <Marker>[
//         Marker(
//             draggable: true,
//             markerId: const MarkerId('Marker'),
//             position: const LatLng(40.9792, 29.1206),
//             onDragEnd: ((newPosition) {})),
//       ],
//     ),

//     mapType: MapType.hybrid,
//     initialCameraPosition: const CameraPosition(
//       target: LatLng(40.9792, 29.1206),
//       zoom: 14.4746,
//     ),
//   ),
// ),

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error('Location permissions are permanently denied, we cannot request permissions.');
  }
  return await Geolocator.getCurrentPosition();
}
