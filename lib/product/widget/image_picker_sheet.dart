import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/constants/text_constants.dart';
import '../utils/padding/page_padding.dart';
import 'elevated_circular_button.dart';
import 'package:kartal/kartal.dart';

import '../../core/init/navigation/router.dart';
import '../utils/radius/general_radius.dart';

class ImagePickerSheet extends StatelessWidget {
  const ImagePickerSheet({Key? key, required this.picker}) : super(key: key);
  final ImagePicker picker;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                width: context.width,
                height: context.width,
                decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: const GeneralRadius.allLow()),
              ),
              Positioned.fill(
                  child: IconButton(
                      onPressed: () async {
                        final result = await picker.pickImage(source: ImageSource.gallery);
                        Navigator.pop(context, result);
                      },
                      icon: const Icon(FontAwesomeIcons.camera)))
            ],
          ),
          context.emptySizedHeightBoxHigh,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomElevatedButton(
                  title: TextConstants.instance.select,
                  buttonWidth: context.width * .45,
                  onPressed: () {
                    return context.router.navigate(const LoginRoute());
                  },
                  isWhite: false),
              CustomElevatedButton(
                  buttonWidth: context.width * .45,
                  title: TextConstants.instance.remove,
                  onPressed: () {
                    return context.router.navigate(const LoginRoute());
                  },
                  isWhite: true),
            ],
          ),
          context.emptySizedHeightBoxLow,
        ],
      ),
    );
  }
}
