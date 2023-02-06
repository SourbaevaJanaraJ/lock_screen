import 'package:flutter/material.dart';
import 'package:lock_screen/custom_widgets/custom_button.dart';
import 'package:lock_screen/custom_widgets/digit_holder.dart';
import 'package:lock_screen/services/local_auth_service.dart';
// import 'package:lock_screen/custom_widgets/my_keyboard.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  var selectedindex = 0;
  String code = '';
  bool authenticated = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextStyle textStyle = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w500,
      color: Colors.grey[700],
    );
    return Scaffold(
      backgroundColor: Colors.grey[150],
      body: Column(
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.all(2),
                      //   child: Image.asset(
                      //     'assets/app.png',
                      //     height: 100,
                      //     width: 100,
                      //   ),
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Login with Touch ID or Passcode',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700],
                          ))
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.all(25.0),
                    padding: const EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DigitHolder(
                          width: width,
                          index: 0,
                          selectedIndex: selectedindex,
                          code: code,
                        ),
                        DigitHolder(width: width, index: 1, selectedIndex: selectedindex, code: code),
                        DigitHolder(width: width, index: 2, selectedIndex: selectedindex, code: code),
                        DigitHolder(width: width, index: 3, selectedIndex: selectedindex, code: code),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
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
                                    onPressed: () async {
                                      final authenticate = await LocalAuth.authenticate();
                                      setState(() {
                                        authenticated = authenticate;
                                      });
                                    }),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
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
