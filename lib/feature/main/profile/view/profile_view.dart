import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/constants/image_constants.dart';
import '../../../../core/init/navigation/router.dart';
import '../../../../product/manager/cache/user_token_cache.dart';
import '../../../../product/mixin/image_picker_mixin.dart';
import '../../../../product/utils/radius/general_radius.dart';
import '../../../../product/widget/elevated_circular_button.dart';
import 'package:kartal/kartal.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/constants/text_constants.dart';
import '../../../../product/utils/padding/page_padding.dart';

class ProfileView extends StatelessWidget with ImagePickerMixin {
  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, title: Text(TextConstants.instance.profile), centerTitle: true),
      body: Padding(
        padding: const PagePadding.horizontalSymmetric(),
        child: Column(children: [
          context.emptySizedHeightBoxNormal,
          Stack(
            children: [
              ClipRRect(
                borderRadius: const GeneralRadius.allNormal(),
                child: Image.asset(ImageConstants.instance.defaultUser, height: context.height * .15),
              ),
              Positioned(
                  bottom: 5,
                  right: 5,
                  child: IconButton(
                      onPressed: () {
                        showImagePickers(context);
                      },
                      icon: const Icon(FontAwesomeIcons.camera)))
            ],
          ),
          context.emptySizedHeightBoxLow3x,
          SizedBox(
            height: context.height * .2,
            child: ClipRRect(
              borderRadius: const GeneralRadius.all(),
              child: GoogleMap(
                // ignore: prefer_collection_literals
                markers: Set<Marker>.of(
                  <Marker>[
                    Marker(
                        draggable: true,
                        markerId: const MarkerId('Marker'),
                        position: const LatLng(40.9792, 29.1206),
                        onDragEnd: ((newPosition) {})),
                  ],
                ),
                mapType: MapType.normal,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(40.9792, 29.1206),
                  zoom: 14.4746,
                ),
              ),
            ),
          ),
          context.emptySizedHeightBoxNormal,
          CustomElevatedButton(
              title: TextConstants.instance.save,
              onPressed: () async {
                await context.router.navigate(const LoginRoute());
              },
              isWhite: true),
          context.emptySizedHeightBoxLow3x,
          CustomElevatedButton(
              title: TextConstants.instance.logOut,
              onPressed: () async {
                await UserCacheService().clearUserBox();
                await context.router.navigate(const LoginRoute());
              },
              isWhite: false),
        ]),
      ),
    );
  }
}

// AnimatedCrossFade _selectedImage(BuildContext context) {
//   return AnimatedCrossFade(
//     duration: context.durationLow,
//     // crossFadeState: _votModelAdd.selectedFile != null ? CrossFadeState.showSecond : CrossFadeState.showFirst,
//     // secondChild: _votModelAdd.selectedFile?.path == null
//         ? const SizedBox()
//         : SizedBox(
//             height: context.dynamicHeight(0.1),
//             width: context.dynamicWidth(0.5),
//             child: FittedBox(
//               fit: BoxFit.fill,
//               child: (_votModelAdd.selectedFile?.path.isNotNullOrNoEmpty ?? false)
//                   ? Image.file(File(_votModelAdd.selectedFile?.path ?? ''))
//                   : FutureBuilder(
//                       future: _votModelAdd.selectedFile?.readAsBytes(),
//                       builder: (BuildContext context, AsyncSnapshot snapshot) {
//                         if (snapshot.hasData) {
//                           return Image.memory(snapshot.data);
//                         } else {
//                           return const CircularProgressIndicator();
//                         }
//                       },
//                     ),
//             ),
//           ),
//     firstChild: ElevatedButton(
//         onPressed: _pickItems,
//         child: const Padding(
//           padding: PagePadding.allLow(),
//           child: Icon(Icons.add_circle_outline, size: 40),
//         )),
//   );
// }

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
