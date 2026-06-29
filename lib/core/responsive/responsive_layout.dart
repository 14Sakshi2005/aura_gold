import 'package:flutter/material.dart';

/// Screen sizes breakpoints
class AppBreakpoints {
  static const double mobileMax = 599;
  static const double tabletMax = 1199;
}

/// Device types supported by the application
enum DeviceType { mobile, tablet, desktop }

/// A widget that renders different layouts based on the screen width.
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  /// Static helper to check the device type
  static DeviceType getDeviceType(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    if (width <= AppBreakpoints.mobileMax) {
      return DeviceType.mobile;
    } else if (width <= AppBreakpoints.tabletMax) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= AppBreakpoints.mobileMax) {
          return mobile;
        } else if (constraints.maxWidth <= AppBreakpoints.tabletMax) {
          return tablet ?? mobile;
        } else {
          return desktop;
        }
      },
    );
  }
}

/// Extension methods to easily check screen sizes directly on BuildContext.
extension ResponsiveContextExtension on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  bool get isMobile => screenWidth <= AppBreakpoints.mobileMax;
  bool get isTablet =>
      screenWidth > AppBreakpoints.mobileMax &&
      screenWidth <= AppBreakpoints.tabletMax;
  bool get isDesktop => screenWidth > AppBreakpoints.tabletMax;

  DeviceType get deviceType => ResponsiveLayout.getDeviceType(this);
}
