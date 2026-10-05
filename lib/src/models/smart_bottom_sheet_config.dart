import 'package:flutter/material.dart';

class SmartBottomSheetConfig {
  final bool autoExpand;
  final bool autoCollapse;
  final double dragSensitivity;
  final double blurSigma;
  final double cornerRadius;
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;
  final Color backgroundColor;
  final Color handleColor;
  final double handleWidth;
  final double handleHeight;

  const SmartBottomSheetConfig({
    this.autoExpand = true,
    this.autoCollapse = true,
    this.dragSensitivity = 1.0,
    this.blurSigma = 8.0,
    this.cornerRadius = 28.0,
    this.initialChildSize = 0.4,
    this.minChildSize = 0.2,
    this.maxChildSize = 0.9,
    this.backgroundColor = Colors.white,
    this.handleColor = const Color(0xFFD0D0D0),
    this.handleWidth = 44.0,
    this.handleHeight = 5.0,
  })  : assert(
  dragSensitivity > 0,
  'dragSensitivity must be greater than 0.',
  ),
        assert(
        blurSigma >= 0,
        'blurSigma cannot be negative.',
        ),
        assert(
        cornerRadius >= 0,
        'cornerRadius cannot be negative.',
        ),
        assert(
        minChildSize > 0 && minChildSize <= 1,
        'minChildSize must be between 0 and 1.',
        ),
        assert(
        initialChildSize > 0 && initialChildSize <= 1,
        'initialChildSize must be between 0 and 1.',
        ),
        assert(
        maxChildSize > 0 && maxChildSize <= 1,
        'maxChildSize must be between 0 and 1.',
        ),
        assert(
        minChildSize <= initialChildSize,
        'minChildSize cannot be greater than initialChildSize.',
        ),
        assert(
        initialChildSize <= maxChildSize,
        'initialChildSize cannot be greater than maxChildSize.',
        );
}