import 'package:flutter/material.dart';

import '../models/smart_bottom_sheet_config.dart';
import '../utils/blur_utils.dart';

class SmartBottomSheet extends StatefulWidget {
  final Widget child;
  final SmartBottomSheetConfig config;

  const SmartBottomSheet({
    super.key,
    required this.child,
    this.config = const SmartBottomSheetConfig(),
  });

  @override
  State<SmartBottomSheet> createState() => _SmartBottomSheetState();
}

class _SmartBottomSheetState extends State<SmartBottomSheet> {
  late double _currentSize;

  @override
  void initState() {
    super.initState();

    _currentSize = widget.config.initialChildSize;
  }

  void _handleDragUpdate(
      DragUpdateDetails details,
      double availableHeight,
      ) {
    if (availableHeight <= 0) {
      return;
    }

    final sensitivity = widget.config.dragSensitivity;

    final delta = -details.delta.dy / availableHeight;

    final adjustedDelta = delta * sensitivity;

    setState(() {
      _currentSize = (_currentSize + adjustedDelta).clamp(
        widget.config.minChildSize,
        widget.config.maxChildSize,
      );
    });
  }

  void _handleDragEnd(DragEndDetails details) {
    final config = widget.config;

    double target = _currentSize;

    if (config.autoExpand &&
        _currentSize > config.initialChildSize) {
      target = config.maxChildSize;
    } else if (config.autoCollapse &&
        _currentSize < config.initialChildSize) {
      target = config.minChildSize;
    } else {
      target = config.initialChildSize;
    }

    setState(() {
      _currentSize = target;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Stack(
      children: [
        _buildBlurBackground(),
        _buildBottomSheet(screenHeight),
      ],
    );
  }

  Widget _buildBlurBackground() {
    return Positioned.fill(
      child: BackdropFilter(
        filter: BlurUtils.create(
          sigma: widget.config.blurSigma,
        ),
        child: Container(
          color: Colors.black.withValues(
            alpha: 0.18,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSheet(double screenHeight) {
    final sheetHeight = screenHeight * _currentSize;

    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 250,
        ),
        curve: Curves.easeOutCubic,
        width: double.infinity,
        height: sheetHeight,
        decoration: BoxDecoration(
          color: widget.config.backgroundColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              widget.config.cornerRadius,
            ),
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 24,
              offset: Offset(0, -8),
              color: Color(0x22000000),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: GestureDetector(
          onVerticalDragUpdate: (details) {
            _handleDragUpdate(
              details,
              screenHeight,
            );
          },
          onVerticalDragEnd: _handleDragEnd,
          child: Column(
            children: [
              _buildDragHandle(),

              Expanded(
                child: widget.child,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDragHandle() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 10,
      ),
      child: Container(
        width: widget.config.handleWidth,
        height: widget.config.handleHeight,
        decoration: BoxDecoration(
          color: widget.config.handleColor,
          borderRadius: BorderRadius.circular(
            widget.config.handleHeight,
          ),
        ),
      ),
    );
  }
}