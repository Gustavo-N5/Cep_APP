// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FildWidgwt extends StatelessWidget {
  final IconButton? iconButton;
  final TextEditingController controller;
  final String label;
  const FildWidgwt({
    Key? key,
    required this.controller,
    required this.label,
    this.iconButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: iconButton,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
    );
  }
}
