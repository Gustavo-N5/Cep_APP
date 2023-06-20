import 'package:flutter/material.dart';

BoxDecoration boxgradiente() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromARGB(255, 17, 195, 226),
        Color.fromARGB(255, 17, 120, 204),
        Color.fromARGB(255, 6, 105, 185),
        Color.fromARGB(255, 2, 98, 177),
        Color.fromARGB(255, 1, 40, 109),
      ],
    ),
  );
}
