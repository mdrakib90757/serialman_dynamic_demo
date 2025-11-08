import 'package:flutter/material.dart';
import 'package:serialman/core/color/color.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  const CustomTextField({
    super.key,
    required this.controller,
     this.labelText,
    this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = false;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.primaryBlue,
      controller: widget.controller,
      obscureText: _isObscured,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,

        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: Colors.grey[600])
            : null,

        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey[600],
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              )
            : null,

        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 12,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey[300]!, width: 1.0),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
           color: AppColor.primary,
            width: 1.5,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
      ),
    );
  }
}
