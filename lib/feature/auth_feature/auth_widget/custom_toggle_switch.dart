import 'package:flutter/material.dart';

class CustomToggleSwitch extends StatefulWidget {
  final String text;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color backgroundColor;
  final Color thumbColor;

  const CustomToggleSwitch({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
    this.backgroundColor = const Color(0xFF2C3E7B),
    this.thumbColor = Colors.white,
  });

  @override
  State<CustomToggleSwitch> createState() => _CustomToggleSwitchState();
}

class _CustomToggleSwitchState extends State<CustomToggleSwitch> {
  final Duration _duration = const Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: AnimatedContainer(
        duration: _duration,
        width: 300,
        height: 50,
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: widget.backgroundColor,

          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Stack(
          children: [
            // AnimatedAlign
            AnimatedAlign(
              duration: _duration,
              curve: Curves.easeOut,
              alignment: widget.value
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            AnimatedAlign(
              duration: _duration,
              curve: Curves.easeOut,

              alignment: widget.value
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: widget.thumbColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
