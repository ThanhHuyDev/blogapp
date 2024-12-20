import 'package:flutter/material.dart';

const kPrimaryGradientLeftToRightColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFBC7BE4), Color(0xFFFF7643)],
);
const kPrimaryGradientRightToLeftColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFF7643), Color(0xFFBC7BE4)],
);
const kPrimaryGradientRightToLeftColorUser = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Colors.deepPurple, Color.fromARGB(255, 235, 156, 218)],
);
const kPrimaryGradientTopToBotColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color(0xFFBC7BE4), Color.fromARGB(255, 221, 140, 110)],
);
