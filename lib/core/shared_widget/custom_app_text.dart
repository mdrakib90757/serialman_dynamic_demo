import 'package:flutter/material.dart';

class CustomAppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final FontStyle? fontStyle;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? letterSpacing;
  final double? height;

  const CustomAppText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.fontStyle,
    this.overflow,
    this.maxLines,
    this.letterSpacing,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize ?? 16.0,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Colors.black,
        fontStyle: fontStyle ?? FontStyle.normal,
        letterSpacing: letterSpacing,
        height: height,
      ),
    );
  }
}
