import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final VoidCallback pressed;
  final Color? bgColor;
  final TextStyle? style;
  final double? width;

  final double? height;
  final Gradient? gradient; // Add gradient property

  const CustomButton(
      {super.key,
      this.text,
      required this.pressed,
      this.bgColor,
      this.style,
      this.height = 50.0,
      this.width = 150,
      this.child,
        this.gradient
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgColor, // Default background color
          gradient: gradient, // Apply gradient if provided
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        alignment: Alignment.center,
        child: child ??
            Text(
              text ?? 'Get',
              style: style ??
                  Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                  ),
            ),
      ),
    );
  }
}
