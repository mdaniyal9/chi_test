import 'package:flutter/material.dart';

abstract class InputStyles{
  static InputDecoration getAuthInput(BuildContext context, { hint, icon, Widget? suffixIcon}) {
    return InputDecoration(
        counterText: '',
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(
            color: Color.fromRGBO(0x38, 0x7b, 0x96, 1.0),
            width: 1.0,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(
            color: Color.fromRGBO(0x38, 0x7b, 0x96, 1.0),
            width: 2.0,
          ),
        ),
        // hintText: hint,
        labelText: hint,
        labelStyle:
        const TextStyle(color: Color.fromRGBO(0x38, 0x7b, 0x96, 1.0)),
        prefixIcon: Transform(
          transform: Matrix4.rotationX(0),
          alignment: Alignment.center,
          child: RotatedBox(
            quarterTurns:  0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              child: Image.asset(
                icon,
                height: 30,
              ),
            ),
          ),
        ),
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(vertical: 17, horizontal: 5));
  }
}