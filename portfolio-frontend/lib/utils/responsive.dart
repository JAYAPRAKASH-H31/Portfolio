import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 850;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 850 && width < 1150;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1150;
  }

  static double horizontalPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return 20;
    if (width < 850) return 32;
    if (width < 1200) return 48;
    return 72;
  }
}