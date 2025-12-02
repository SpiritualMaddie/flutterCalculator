import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final Color color;
  final Color textColor;
  final String buttonText;
  final VoidCallback? buttonTapped;

  const Button({
    super.key,
    required this.color,
    required this.textColor,
    required this.buttonText,
    this.buttonTapped,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _pressed = false;

  void _handleTapDown(TapDownDetails _) {
    setState(() => _pressed = true);
  }

  void _handleTapUp(TapUpDetails _) {
    setState(() => _pressed = false);
    widget.buttonTapped?.call();
  }

  void _handleCancel() {
    setState(() => _pressed = false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AnimatedScale(
        scale: _pressed ? 0.93 : 1.0,
        duration: const Duration(milliseconds: 70),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 70),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(_pressed ? 1 : 4, _pressed ? 1 : 4),
                blurRadius: _pressed ? 3 : 8,
              ),
            ],
          ),
          child: Material(
            color: widget.color,
            borderRadius: BorderRadius.circular(35),
            child: InkWell(
              onTapDown: _handleTapDown,
              onTapUp: _handleTapUp,
              onTapCancel: _handleCancel,
              borderRadius: BorderRadius.circular(35),
              child: Container(
                height: 70,
                alignment: Alignment.center,
                child: Text(
                  widget.buttonText,
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
