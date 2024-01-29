import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;

  const CustomTextField({
    this.labelText = '',
    this.hintText = '',
    this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.teal),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.teal.shade50,
          // enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: const EdgeInsets.all(12),
          labelText: labelText,
          floatingLabelStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal.shade50),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
