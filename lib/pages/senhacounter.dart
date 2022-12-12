import 'dart:async';
import 'package:flutter/material.dart';

class PasswordValidator extends StatelessWidget {
  late String _password;
  late String password_strength;
  late Color password_strength_color;
  late double password_strength_level;
  final StreamController<int> _streamController = StreamController();

  int passwordStrengthLevel(String s) {
    int strength = 0;
    RegExp uppercase_check = RegExp(r'^(?=.*?[A-Z])');
    RegExp number_check = RegExp(r'^(?=.*[0-9].*[0-9])');
    RegExp special_character_check = RegExp(r'^(?=.*[!@#$&*])');

    if (uppercase_check.hasMatch(s)) {
      strength++;
    }
    if (number_check.hasMatch(s)) {
      strength++;
    }
    if (special_character_check.hasMatch(s)) {
      strength++;
    }
    return strength;
  }

  void password_strength_checker(String password) {
    int strength = passwordStrengthLevel(password);
    print(strength);
    _streamController.add(strength);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      _password = value;
                      password_strength_checker(_password);
                    },
                    decoration: InputDecoration(hintText: 'Enter Your Password'),
                  ),
                  Container(
                    width: 400,
                    height: 100,
                    child: StreamBuilder<int?>(
                        stream: _streamController.stream,
                        builder: (context, snapshot) {
                          if (snapshot.data == null) {
                            password_strength_color = Colors.grey;
                            password_strength_level = 0;
                            password_strength = "";
                          } else if (snapshot.data == 0) {
                            password_strength_color = Colors.grey;
                            password_strength_level = 0;
                            password_strength = "";
                          } else if (snapshot.data == 1) {
                            password_strength_color = Colors.red;
                            password_strength_level = 0.3;
                            password_strength = "weak";
                          } else if (snapshot.data == 2) {
                            password_strength_color = Colors.yellow;
                            password_strength_level = 0.65;
                            password_strength = "moderate";
                          } else if (snapshot.data == 3) {
                            password_strength_color = Colors.green;
                            password_strength_level = 1;
                            password_strength = "good";
                          }
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: LinearProgressIndicator(
                                    value: password_strength_level,
                                    color: password_strength_color,
                                    backgroundColor: Colors.grey,
                                  ),
                                  height: 5,
                                  width: 200,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                child: Text("$password_strength"),
                                width: 70,
                              )
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
