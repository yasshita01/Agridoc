import 'package:flutter/material.dart';

showLoading(BuildContext context) {
  return SizedBox(
    width: 20,
    height: 40,
    child: FittedBox(
      child: CircularProgressIndicator(
        strokeWidth: 3,
        backgroundColor: Colors.white,
      ),
    ),
  );
}
