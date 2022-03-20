import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartal/kartal.dart';
import '../utils/radius/general_radius.dart';

import '../widget/image_picker_sheet.dart';

mixin ImagePickerMixin {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> showImagePickers(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: GeneralRadius.allLow()),
      builder: (context) {
        return SizedBox(height: context.height, child: ImagePickerSheet(picker: _picker));
      },
    );
  }
}
