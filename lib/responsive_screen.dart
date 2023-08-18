import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget webBody;

  const ResponsiveLayout(
      {super.key,
      required this.mobileBody,
      required this.tabletBody,
      required this.webBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth > 1000) {
        return webBody;
      } else if (constrains.maxWidth > 600) {
        return tabletBody;
      } else {
        return mobileBody;
      }
    });
  }
}
