import 'package:flutter/rendering.dart';

class GeneralRadius extends BorderRadius {
  const GeneralRadius.all() : super.all(const Radius.circular(32));
  const GeneralRadius.vertical() : super.vertical(top: const Radius.circular(32));
  const GeneralRadius.only()
      : super.only(bottomLeft: const Radius.circular(40), bottomRight: const Radius.circular(40.0));
  const GeneralRadius.allNormal() : super.all(const Radius.circular(16));
  const GeneralRadius.allLow() : super.all(const Radius.circular(10));
  GeneralRadius.onlyBottom()
      : super.only(bottomLeft: const Radius.circular(16), bottomRight: const Radius.circular(16));
}
