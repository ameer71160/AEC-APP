import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_theme.dart';

class LogoWidget extends StatelessWidget {
  final double size;
  final bool showName;
  final bool animated;

  const LogoWidget({
    super.key,
    this.size = 60,
    this.showName = false,
    this.animated = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 15,
                spreadRadius: 3,
              ),
            ],
          ),
          child: CustomPaint(
            painter: _AECLogoPainter(),
            child: Center(
              child: Text(
                'AEC',
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: size * 0.35,
                ),
              ),
            ),
          ),
        ).animate(onPlay: (controller) => controller.repeat())
         .scale(duration: 1500.ms, begin: const Offset(0.9, 0.9), end: const Offset(1.1, 1.1))
         .then()
         .rotate(duration: 2000.ms, begin: -0.05, end: 0.05),
        if (showName) ...[
          const SizedBox(height: 4),
          Text(
            'AEC Community',
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: size * 0.25,
            ),
          ),
        ],
      ],
    );
  }
}

// رسم دائرة خلفية جميلة مع تدرج لوني بدلاً من الصورة
class _AECLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF1A237E), Color(0xFF0D47A1)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 * 0.85;
    canvas.drawCircle(center, radius, paint);

    // إضافة شكل نجمي أو أيقونة بسيطة كخلفية للشعار
    final starPaint = Paint()
      ..color = Colors.white.withOpacity(0.15)
      ..style = PaintingStyle.fill;
    
    // رسم نجمة بسيطة
    final path = Path();
    const double outerRadius = 20;
    const double innerRadius = 10;
    const int points = 5;
    for (int i = 0; i < points * 2; i++) {
      double angle = (i * 3.14159 / points) - 3.14159 / 2;
      double r = (i % 2 == 0) ? outerRadius : innerRadius;
      double x = center.dx + r * (size.width / 60) * (i % 2 == 0 ? 1 : 0.6);
      double y = center.dy + r * (size.height / 60) * (i % 2 == 0 ? 1 : 0.6);
      if (i == 0) path.moveTo(x, y);
      else path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, starPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
