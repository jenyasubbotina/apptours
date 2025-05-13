import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:apptours/core/theme/default/theme.dart';

class BlurredContainer extends StatelessWidget {
  const BlurredContainer({
    this.width,
    this.height,
    this.borderRadius,
    this.horizontalPadding,
    this.imageFilter,
    required this.child,
    super.key,
  });

  final double? width;
  final double? height;
  final double? borderRadius;
  final double? horizontalPadding;
  final Widget child;
  final ImageFilter? imageFilter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRect(
        child: BackdropFilter(
          filter: imageFilter ?? ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 0),
            decoration: BoxDecoration(
              color: AppColors.light30,
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
