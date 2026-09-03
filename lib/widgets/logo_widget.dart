import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(size * 0.15),
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
          ),
        ).animate(onPlay: (controller) => controller.repeat())
         .scale(duration: 1500.ms, begin: Offset(0.9,0.9), end: Offset(1.1,1.1))
         .then()
         .rotate(duration: 2000.ms, begin: -0.05, end: 0.05),
        if (showName) ...[
          const SizedBox(height: 4),
          Text(
            'AEC',
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: size * 0.3,
            ),
          ),
        ],
      ],
    );
  }
}
