import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.backgroundColor, this.child, this.onPressed});
  Color? backgroundColor;
  Function()? onPressed;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const CircleBorder(),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(20),
        ),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.blue.shade100;
          }
          return null;
        }),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
