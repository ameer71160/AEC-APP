import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  final String text;
  final double speed;
  final TextStyle style;
  final TextAlign textAlign;

  const AnimatedText({
    super.key,
    required this.text,
    this.speed = 80, // زيادة السرعة = أبطأ (كلما زاد الرقم، أصبح أبطأ)
    this.style = const TextStyle(fontSize: 16),
    this.textAlign = TextAlign.center,
  });

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: (widget.text.length * widget.speed).toInt()),
      vsync: this,
    );
    _animation = Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(1, 0)).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Text(
        widget.text,
        style: widget.style,
        textAlign: widget.textAlign,
      ),
    );
  }
}
