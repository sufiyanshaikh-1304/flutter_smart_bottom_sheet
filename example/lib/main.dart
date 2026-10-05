import 'package:flutter/material.dart';
import 'package:flutter_smart_bottom_sheet/flutter_smart_bottom_sheet.dart';

void main() {
  runApp(const SmartBottomSheetDemoApp());
}

class SmartBottomSheetDemoApp extends StatelessWidget {
  const SmartBottomSheetDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart BottomSheet Demo',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
        ),
      ),
      home: const SmartBottomSheetHomePage(),
    );
  }
}

class SmartBottomSheetHomePage extends StatelessWidget {
  const SmartBottomSheetHomePage({super.key});

  void _showSmartBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (context) {
        return SmartBottomSheet(
          config: const SmartBottomSheetConfig(
            autoExpand: true,
            autoCollapse: true,
            dragSensitivity: 1.0,
            blurSigma: 8.0,
            cornerRadius: 28.0,
            initialChildSize: 0.42,
            minChildSize: 0.22,
            maxChildSize: 0.88,
          ),
          child: const _BottomSheetContent(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Smart BottomSheet',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        children: [
          const Text(
            'Smart BottomSheet Library',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'A customizable bottom sheet with smooth dragging, blur background and flexible corner radius.',
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 24),
          const _FeatureCard(
            icon: Icons.open_in_full_rounded,
            title: 'Auto Expand / Collapse',
            description:
            'Smooth snapping between minimum, initial and maximum sizes.',
          ),
          const SizedBox(height: 12),
          const _FeatureCard(
            icon: Icons.swipe_vertical_rounded,
            title: 'Drag Sensitivity',
            description:
            'Configure how responsive the bottom sheet should feel.',
          ),
          const SizedBox(height: 12),
          const _FeatureCard(
            icon: Icons.blur_on_rounded,
            title: 'Blur Background',
            description:
            'Create a beautiful blurred background behind the sheet.',
          ),
          const SizedBox(height: 12),
          const _FeatureCard(
            icon: Icons.rounded_corner,
            title: 'Custom Corner Radius',
            description:
            'Customize the top corners according to your UI design.',
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: FilledButton.icon(
              onPressed: () => _showSmartBottomSheet(context),
              icon: const Icon(
                Icons.keyboard_arrow_up_rounded,
              ),
              label: const Text(
                'Open Smart BottomSheet',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 18,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFFEDE7F6),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF6750A4),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.35,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomSheetContent extends StatelessWidget {
  const _BottomSheetContent();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
      children: [
        const Text(
          'Smart Controls',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Drag this sheet up and down to test the smart snapping behavior.',
          style: TextStyle(
            fontSize: 14,
            height: 1.5,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 22),
        const _ControlTile(
          icon: Icons.expand_rounded,
          title: 'Auto Expand',
          value: 'Enabled',
        ),
        const _ControlTile(
          icon: Icons.unfold_less_rounded,
          title: 'Auto Collapse',
          value: 'Enabled',
        ),
        const _ControlTile(
          icon: Icons.swipe_vertical_rounded,
          title: 'Drag Sensitivity',
          value: '1.0x',
        ),
        const _ControlTile(
          icon: Icons.blur_on_rounded,
          title: 'Background Blur',
          value: '8.0',
        ),
        const _ControlTile(
          icon: Icons.rounded_corner,
          title: 'Corner Radius',
          value: '28.0',
        ),
        const SizedBox(height: 18),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F2FA),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.touch_app_rounded,
                color: Color(0xFF6750A4),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Drag the sheet up and down to test the expand and collapse behavior.',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ControlTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _ControlTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 22,
            color: const Color(0xFF6750A4),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}