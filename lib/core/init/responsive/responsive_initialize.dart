import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class ResponsiveInitialize {
  ResponsiveInitialize._init();

  static Widget builder({Widget? child}) {
    return ResponsiveWrapper.builder(
      child,
      maxWidth: 1200,
      minWidth: 480,
      defaultScale: true,
      breakpoints: [
        const ResponsiveBreakpoint.resize(480, name: MOBILE),
        const ResponsiveBreakpoint.autoScale(800, name: TABLET),
        const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
      ],
    );
  }
}
