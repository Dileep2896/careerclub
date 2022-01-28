// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:careerclub/components/loading_dialog.dart';
import 'package:careerclub/screens/bottom_navigation.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../components/constants.dart';
import '../components/rounded_button.dart';
import '../api/user_actions.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static String id = 'register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // creating firebase auth instance
  FirebaseAuth auth = FirebaseAuth.instance;

  String password = "";
  String rePassword = "";
  String revaMail = "";
  String phoneNumber = "";
  String srn = "";
  String name = "";
  String? registerError;

  bool isPasswordVisible = true;
  bool isRePasswordVisible = true;
  bool isPasswordMatch = true;
  bool isMail = true;
  bool isRevaMail = true;
  bool isPhoneVal = true;
  bool isSRNVal = true;
  bool isNameVal = true;
  bool isPassword = true;
  bool isRePassword = true;
  bool isRegisterError = false;
  bool isLoading = false;

  // function to validate the email
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

  // function to validate the password matchings
  void validatePasswordsMatch() {
    if (rePassword != password) {
      isPasswordMatch = false;
    } else {
      isPasswordMatch = true;
    }
  }

  // function to validate the password field
  void validatePasswordField() {
    setState(() {
      if (password.isEmpty) {
        isPassword = false;
      } else {
        isPassword = true;
      }
      if (rePassword.isEmpty) {
        isRePassword = false;
      } else {
        isRePassword = true;
      }
    });
  }

  // function to validate the phone number
  void validatePhone() {
    setState(() {
      if (phoneNumber.length != 10) {
        isPhoneVal = false;
      } else {
        isPhoneVal = true;
      }
    });
  }

  // function to validate the srn number
  void validateSRN() {
    setState(() {
      if (srn.length != 8) {
        isSRNVal = false;
      } else {
        isSRNVal = true;
      }
    });
  }

  // function to validate the name field
  void validateName() {
    setState(() {
      if (name.isEmpty) {
        isNameVal = false;
      } else {
        isNameVal = true;
      }
    });
  }

  // function to validate the errors
  bool validateErrors() {
    if (isPasswordMatch == false ||
        isMail == false ||
        isRevaMail == false ||
        isPhoneVal == false ||
        isSRNVal == false ||
        isNameVal == false) {
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
              child: SafeArea(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Hero(
                        tag: "logo",
                        child: SizedBox(
                          height: 200.0,
                          child: Image.asset(
                            "images/logo.png",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          //Do something with the user input.
                          name = value;
                          if (isNameVal == false) {
                            validateName();
                          }
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          labelText: "Full Name",
                          prefixIcon: const Icon(
                            Icons.person,
                          ),
                          errorText: isNameVal ? null : "Enter the name",
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          //Do something with the user input.
                          srn = value;
                          if (isSRNVal == false) {
                            validateSRN();
                          }
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          labelText: "SRN",
                          prefixIcon: const Icon(
                            Icons.card_membership,
                          ),
                          errorText:
                              isSRNVal ? null : "Enter a valid SRN number",
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          //Do something with the user input.
                          phoneNumber = value;
                          if (isPhoneVal == false) {
                            validatePhone();
                          }
                        },
                        onSubmitted: (value) {
                          validatePhone();
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          labelText: "Phone Number",
                          prefixIcon: const Icon(
                            Icons.phone,
                          ),
                          errorText: isPhoneVal ? null : "Enter a valid number",
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
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
                            prefixIconColor: isRevaMail ? null : Colors.red),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        obscureText: isPasswordVisible ? true : false,
                        onChanged: (value) {
                          //Do something with the user input.
                          setState(() {
                            password = value;
                          });
                          if (isPassword == false) {
                            validatePasswordField();
                          }
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
                          errorText:
                              isPassword ? null : "This field can't be empty",
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        obscureText: isRePasswordVisible ? true : false,
                        onChanged: (value) {
                          //Do something with the user input.
                          rePassword = value;
                          if (isPasswordMatch == false) {
                            setState(() {
                              validatePasswordsMatch();
                            });
                          }
                          validatePasswordField();
                        },
                        onSubmitted: (value) {
                          setState(() {
                            validatePasswordsMatch();
                          });
                          validatePasswordField();
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          labelText: "Re-Password",
                          prefixIcon: const Icon(
                            Icons.password,
                          ),
                          errorText: isRePassword
                              ? isPasswordMatch
                                  ? null
                                  : "Password and RePassword Is Not same"
                              : "This field can't be empty",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isRePasswordVisible = !isRePasswordVisible;
                              });
                            },
                            icon: isRePasswordVisible
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                          ),
                        ),
                        cursorColor: primaryColor,
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      isRegisterError
                          ? Text(
                              isRegisterError ? registerError! : "",
                              style: const TextStyle(
                                color: Colors.red,
                              ),
                            )
                          : Container(
                              height: 0,
                            ),
                      RoundedButton(
                        onPressed: () {
                          setState(() {
                            validatePasswordsMatch();
                            validateEmails();
                          });
                          validatePasswordField();
                          validatePhone();
                          validateSRN();
                          validateName();

                          if (name.isEmpty ||
                              srn.isEmpty ||
                              phoneNumber.isEmpty ||
                              revaMail.isEmpty ||
                              password.isEmpty ||
                              rePassword.isEmpty) {
                            // Throw Error
                            // ignore: avoid_print
                            print("all fields are empty");
                          } else {
                            if (validateErrors()) {
                              // Login the user
                              // ignore: avoid_print
                              print("Register");
                              setState(() {
                                isLoading = true;
                              });
                              Future<String?> registerMessage = registerUser(
                                  revaMail: revaMail,
                                  rePassword: rePassword,
                                  name: name,
                                  srn: srn,
                                  phoneNumber: phoneNumber);
                              registerMessage.then((error) {
                                if (error == null) {
                                  // ignore: avoid_print
                                  print(registerMessage);
                                  Navigator.pushNamed(
                                      context, BottomNavigationScreen.id);
                                  setState(() {
                                    isLoading = false;
                                    isRegisterError = false;
                                    registerError = error;
                                  });
                                } else {
                                  setState(() {
                                    isLoading = false;
                                    isRegisterError = true;
                                    registerError = error;
                                  });
                                }
                              });
                            } else {
                              // Throw Error
                              // ignore: avoid_print
                              print('errors in the text fields');
                            }
                          }
                        },
                        color: primaryColor,
                        title: "Register",
                        titleColor: darkColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
