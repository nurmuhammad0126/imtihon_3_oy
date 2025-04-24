import 'package:flutter/material.dart';

class FILEDButton extends StatelessWidget {
  final Color buttonColor;
  final String name;
  final VoidCallback? onPressed;
  final Widget icon;
  final double heightFactor;
  final double widthFactor;

  const FILEDButton({
    super.key,
    required this.buttonColor,
    required this.name,
    this.onPressed,
    required this.icon,
    required this.heightFactor,
    required this.widthFactor,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    double buttonHeight = screenHeight * heightFactor;
    double buttonWidth = screenWidth * widthFactor;

    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: buttonWidth * 0.05, vertical: buttonHeight * 0.1),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            icon: icon,
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}
