import 'package:flutter/material.dart';
import 'package:serialman/core/shared_widget/custom_app_text.dart';
class CustomActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;
  final VoidCallback onPressed;

  const CustomActionButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.textColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: iconColor, size: 20),
      label: CustomAppText(
        text: label,
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(
            color: backgroundColor == Colors.white ? Colors.grey.shade300 : Colors.transparent,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        elevation: 0,
      ),
    );
  }
}