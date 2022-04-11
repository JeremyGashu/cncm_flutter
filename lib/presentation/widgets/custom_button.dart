import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget customButton(
    {required String text,
    required Function onClick,
    Color? backgroundColor,
    Color? borderColor,
    Color? textColor}) {
  return InkWell(
    onTap: () {
      onClick();
    },
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.green,
        borderRadius: BorderRadius.circular(8),
        border: borderColor != null
            ? Border.all(color: borderColor, width: 2)
            : null,
      ),
      height: 60,
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: textColor ?? Colors.white, fontSize: 14),
          // textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
