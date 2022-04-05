import 'package:aguia_real_dbv/src/shared/utils.dart';
import 'package:flutter/material.dart';

Widget itemShortCut(IconData icon, String label) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, size: 40.0, color: Utils.greyDark),
      Text(label),
    ],
  );
}
