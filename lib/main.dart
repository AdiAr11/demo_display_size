import 'dart:ui' as ui;

import 'package:demo_display_size/desktop_body.dart';
import 'package:demo_display_size/homepage.dart';
import 'package:demo_display_size/mobile_body.dart';
import 'package:demo_display_size/responsive_screen.dart';
import 'package:demo_display_size/tablet_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Display tells the actual size, refresh rate etc of device.
//size is the actual size, not the size of the window after changing.
//MediaQuery gives the size at that time, i.e after changing.
ui.Display? display;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  static const double kOrientationLockBreakpoint = 600;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    display = View.maybeOf(context)?.display;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    display = null;
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final ui.Display? otherDisplay = display;
    if (otherDisplay == null) {
      return;
    }
    if (otherDisplay.size.width / otherDisplay.devicePixelRatio <
        kOrientationLockBreakpoint) {
      SystemChrome.setPreferredOrientations(<DeviceOrientation>[
        DeviceOrientation.portraitUp,
      ]);
    } else {
      SystemChrome.setPreferredOrientations(<DeviceOrientation>[]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: Homepage(),
      home: ResponsiveLayout(
        mobileBody: MobileBody(),
        tabletBody: TabletBody(),
        webBody: DesktopBody(),
      ),
    );
  }
}
