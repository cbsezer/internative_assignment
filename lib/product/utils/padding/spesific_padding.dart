import 'package:flutter/rendering.dart';

import '../size/widget_size.dart';

class SpesificPadding extends EdgeInsets {
  const SpesificPadding.all(double value) : super.all(value);

  const SpesificPadding.allSocialButton() : super.all(WidgetSizes.spacingXxs);
}
