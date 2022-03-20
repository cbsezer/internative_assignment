import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:internative_assignment/product/service/get_user_info.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/image_constants.dart';
import '../../../../core/init/navigation/router.dart';
import '../../../../product/manager/cache/user_token_cache.dart';
import '../../../../product/mixin/image_picker_mixin.dart';
import '../../../../product/service/user_state.dart';
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
    var currentUser = Provider.of<UserProvider>(context, listen: false).currentUser;

    return Scaffold(
      appBar: AppBar(
          leading: const SizedBox(),
          backgroundColor: Colors.white,
          title: Text(TextConstants.instance.profile),
          centerTitle: true),
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
                        position: LatLng(double.parse(currentUser!.user!.location?.latitude ?? '0'),
                            double.parse(currentUser.user!.location?.longtitude ?? '0')),
                        onDragEnd: ((newPosition) async {
                          await UserService().updateUserInfo(context, newPosition);
                        })),
                  ],
                ),
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                    target: LatLng(double.parse(currentUser.user!.location?.latitude ?? '0'),
                        double.parse(currentUser.user!.location?.longtitude ?? '0')),
                    zoom: 14.4746),
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
