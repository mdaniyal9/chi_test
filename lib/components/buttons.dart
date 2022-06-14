import 'package:flutter/material.dart';

class ProgressElevatedButton extends StatelessWidget {
  final String label;
  final Color? labelColor;
  final Color? progressColor;
  final bool isBusy;
  final VoidCallback onPressed;
  final double? labelSize;

  const ProgressElevatedButton({
    Key? key,
    required this.label,
    required this.isBusy,
    required this.onPressed,
    this.labelColor = Colors.black,
    this.progressColor = const Color.fromRGBO(0x38, 0x7b, 0x96, 1.0),
    this.labelSize = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: const Color.fromRGBO(0x38, 0x7b, 0x96, 1.0)),
        onPressed: isBusy ? null : onPressed,
        child: isBusy
            ? CircularProgressIndicator(
                color: progressColor,
              )
            : Text(
                label,
                style: TextStyle(color: labelColor, fontSize: labelSize),
              ));
  }
}
