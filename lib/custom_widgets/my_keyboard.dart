import 'package:flutter/material.dart';
import 'package:lock_screen/custom_widgets/custom_button.dart';

class MyKeyboard extends StatefulWidget {
  const MyKeyboard({super.key});

  @override
  State<MyKeyboard> createState() => _MyKeyboardState();
}

class _MyKeyboardState extends State<MyKeyboard> {
  var selectedindex = 0;

  String code = '';

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w500,
      color: Colors.grey[700],
    );
    return Container(
      color: Colors.blue[150],
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomButton(
                    backgroundColor: Colors.blue.shade50,
                    child: Text('1', style: textStyle),
                    onPressed: () {
                      addDigit(1);
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomButton(
                    backgroundColor: Colors.blue.shade50,
                    child: Text('2', style: textStyle),
                    onPressed: () {
                      addDigit(2);
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomButton(
                    backgroundColor: Colors.blue.shade50,
                    child: Text('3', style: textStyle),
                    onPressed: () {
                      addDigit(3);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomButton(
                    backgroundColor: Colors.blue.shade50,
                    child: Text('4', style: textStyle),
                    onPressed: () {
                      addDigit(4);
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomButton(
                    backgroundColor: Colors.blue.shade50,
                    child: Text('5', style: textStyle),
                    onPressed: () {
                      addDigit(5);
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomButton(
                    backgroundColor: Colors.blue.shade50,
                    child: Text('6', style: textStyle),
                    onPressed: () {
                      addDigit(6);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomButton(
                    backgroundColor: Colors.blue.shade50,
                    child: Text('7', style: textStyle),
                    onPressed: () {
                      addDigit(7);
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomButton(
                    backgroundColor: Colors.blue.shade50,
                    child: Text('8', style: textStyle),
                    onPressed: () {
                      addDigit(8);
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomButton(
                    backgroundColor: Colors.blue.shade50,
                    child: Text('9', style: textStyle),
                    onPressed: () {
                      addDigit(9);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: CustomButton(
                    backgroundColor: Colors.red,
                    onPressed: () => backspace(),
                    child: Icon(Icons.backspace_outlined, color: Colors.grey[700], size: 30),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomButton(
                    backgroundColor: Colors.blue.shade50,
                    child: Text('0', style: textStyle),
                    onPressed: () {
                      addDigit(0);
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomButton(
                      backgroundColor: Colors.blue.shade700,
                      child: const Icon(Icons.fingerprint, color: Colors.white, size: 40),
                      onPressed: () {}),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  addDigit(int digit) {
    if (code.length > 3) {
      return;
    }
    setState(() {
      code = code + digit.toString();
      // print('Code is $code');
      selectedindex = code.length;
    });
  }

  backspace() {
    if (code.isEmpty) {
      return;
    }
    setState(() {
      code = code.substring(0, code.length - 1);
      selectedindex = code.length;
    });
  }
}
