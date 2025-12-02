import 'package:flutter/material.dart';

// A custom animated button widget for the calculator.
// Features:
// - Press animation with scale and shadow effects
// - Support for both tap and long press gestures
// - Customizable colors and text
class Button extends StatefulWidget {
  final Color color;
  final Color textColor;
  final String buttonText;
  final VoidCallback? buttonTapped;
  final VoidCallback? buttonLongPressed;

  const Button({
    super.key,
    required this.color,
    required this.textColor,
    required this.buttonText,
    this.buttonTapped,
    this.buttonLongPressed,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _pressed = false;

  // Handles the initial touch down on the button
  // Sets the pressed state to true, triggering the press animation
  void _handleTapDown(TapDownDetails _) {
    setState(() => _pressed = true);
  }

  // Handles when the touch is released
  // Resets the pressed state and executes the tap callback
  void _handleTapUp(TapUpDetails _) {
    setState(() => _pressed = false);
    widget.buttonTapped?.call();
  }

  // Handles when the touch is cancelled (e.g., finger dragged away)
  // Resets the pressed state without executing the callback
  void _handleCancel() {
    setState(() => _pressed = false);
  }

  // Handles long press gestures
  // Executes the long press callback if provided
  void _handleLongPressed() {
    widget.buttonLongPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AnimatedScale(
        // Scale down to 93% when pressed for tactile feedback
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
                // Reduce shadow offset when pressed to create depth effect
                offset: Offset(_pressed ? 1 : 4, _pressed ? 1 : 4),
                blurRadius: _pressed ? 3 : 8,
              ),
            ],
          ),
          child: Material(
            color: widget.color,
            borderRadius: BorderRadius.circular(35),
            child: InkWell(
              // Connect InkWell's gesture detection to custom handlers
              // triggers when finger first touches the button
              onTapDown: _handleTapDown,
              // triggers when finger lifts, completing the tap
              onTapUp: _handleTapUp,
              // triggers if touch is dragged away before release
              onTapCancel: _handleCancel,
              // triggers after holding for ~500ms
              onLongPress: _handleLongPressed,
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
