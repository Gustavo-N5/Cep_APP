import 'package:flutter/material.dart';

AppBar appBar(double altura) {
  return AppBar(
    leadingWidth: 100,
    toolbarHeight: altura * 0.10,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
