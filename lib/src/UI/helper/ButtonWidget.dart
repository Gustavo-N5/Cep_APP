import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  const ButtonWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 6, 105, 185)),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }
}
