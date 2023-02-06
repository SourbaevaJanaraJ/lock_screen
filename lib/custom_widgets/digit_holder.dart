import 'package:flutter/material.dart';

class DigitHolder extends StatelessWidget {
  final int selectedIndex;
  final int index;
  final String code;
  const DigitHolder({
    required this.selectedIndex,
    Key? key,
    required this.width,
    required this.index,
    required this.code,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: width * 0.10,
      width: width * 0.10,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(color: Colors.grey.shade100, shape: BoxShape.circle, boxShadow: [
        BoxShadow(
          color: index == selectedIndex ? Colors.blue : Colors.transparent,
          offset: const Offset(0, 0),
          spreadRadius: 1.5,
          blurRadius: 3,
        )
      ]),
      child: code.length > index
          ? Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.black.withBlue(40),
                shape: BoxShape.circle,
              ),
            )
          : Container(),
    );
  }
}
