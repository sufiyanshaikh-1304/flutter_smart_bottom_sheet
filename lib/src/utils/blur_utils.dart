import 'dart:ui';

class BlurUtils {
  const BlurUtils._();

  static ImageFilter create({
    required double sigma,
  }) {
    return ImageFilter.blur(
      sigmaX: sigma,
      sigmaY: sigma,
    );
  }
}