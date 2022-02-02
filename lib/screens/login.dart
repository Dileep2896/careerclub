// ignore: import_of_legacy_library_into_null_safe
import 'package:careerclub/utils/drawer_controller.dart';
import 'package:careerclub/widgets/loading_dialog.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../models/constants.dart';
import '../styles/colors.dart';
import '../utils/user_actions.dart';
import '../widgets/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String revaMail = "";
  String password = "";
  String? loginError = "";

  bool isMail = true;
  bool isRevaMail = true;
  bool isPassword = true;
  bool isPasswordVisible = true;
  bool isLoading = false;
  bool isLoginError = false;

  void validateEmails() {
    if (EmailValidator.validate(revaMail)) {
      isMail = true;
      var checkMail = revaMail.split('.');
      setState(() {
        if (checkMail[1] != 'reva') {
          isRevaMail = false;
        } else {
          isRevaMail = true;
        }
      });
    } else {
      isMail = false;
    }
  }

  void validatePasswordField() {
    setState(() {
      if (password.isEmpty) {
        isPassword = false;
      } else {
        isPassword = true;
      }
    });
  }

  bool validateErrors() {
    if (isMail == false || isRevaMail == false) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const LoadingDialog()
        : Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    child: Hero(
                      tag: "logo",
                      child: SizedBox(
                        height: 200.0,
                        child: Image.asset(
                          "images/logo.png",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      //Do something with the user input.
                      revaMail = value;
                      if (isMail == false || isRevaMail == false) {
                        validateEmails();
                      }
                    },
                    onSubmitted: (value) {
                      setState(() {
                        validateEmails();
                      });
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      labelText: "Reva Mail",
                      errorText: isMail
                          ? isRevaMail
                              ? null
                              : "Please enter reva email"
                          : "Please enter a valid email",
                      prefixIconColor: isRevaMail ? null : Colors.red,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  // ----------------- Password Text Fiels ----------------- //
                  TextField(
                    obscureText: isPasswordVisible ? true : false,
                    onChanged: (value) {
                      //Do something with the user input.
                      password = value;
                      setState(() {
                        validatePasswordField();
                      });
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      labelText: "Password",
                      prefixIcon: const Icon(
                        Icons.password,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        icon: isPasswordVisible
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                      errorText: isPassword ? null : "This is a required field",
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  isLoginError
                      ? Text(
                          loginError!,
                          style: const TextStyle(
                            color: Colors.redAccent,
                          ),
                        )
                      : const SizedBox(
                          width: 0,
                          height: 0,
                        ),
                  RoundedButton(
                    onPressed: () {
                      setState(() {
                        validateEmails();
                      });
                      validatePasswordField();
                      if (revaMail.isEmpty || password.isEmpty) {
                        // Throw Error
                        // ignore: avoid_print
                        print('Fields Are Empty');
                      } else {
                        if (validateErrors()) {
                          // Login

                          setState(() {
                            isLoading = true;
                          });
                          Future<String?> loginMessage = login(
                            revaMail: revaMail,
                            password: password,
                          );
                          loginMessage.then((value) {
                            if (value == null) {
                              Navigator.pushReplacementNamed(
                                  context, DrawerControllerScreen.id);
                              setState(() {
                                isLoading = false;
                                isLoginError = false;
                              });
                            } else {
                              setState(() {
                                isLoading = false;
                                isLoginError = true;
                                loginError = value;
                              });
                            }
                          });
                        } else {
                          // Throw Error
                          // ignore: avoid_print
                          print("Error in text fields");
                          setState(() {
                            isLoading = false;
                          });
                        }
                      }
                    },
                    color: primaryColor,
                    title: "Log In",
                    titleColor: Colors.white,
                  )
                ],
              ),
            ),
          );
  }
}
