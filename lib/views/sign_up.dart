import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:younusorvba/constants/colors_of_app.dart';
import 'package:provider/provider.dart';
import 'package:younusorvba/provider/internet_check_provider.dart';
import 'package:younusorvba/provider/sign_up_provider.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:password_strength/password_strength.dart';

class SignUp extends StatefulWidget {
  static const route = "/SignUp";
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();

  //?------------TextEditingController--------
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  //?------------TextEditingController--------

  //?------------Variables--------
  // ignore: prefer_typing_uninitialized_variables
  var valueOfPassword;

  //?------------Variables--------

//?-----Functions--------

//*------Net Connection Check-----
  netCheck() async {
    bool netResul =
        await context.read<InterNetCheckProvier>().netCheck(context);
    return netResul;
  }

//?-----Functions--------

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    //?------------Provider Work---------------
    var signUpRead = context.read<SignUpProvider>();
    var signUpWatch = context.watch<SignUpProvider>();
    //?------------Provider Work---------------

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ORVBA",
                        style: TextStyle(
                          fontFamily: 'Comfortaa',
                          color: primaryColorDark,
                          fontSize: width * 0.12,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Text(
                    "Create Account",
                    style: TextStyle(
                      color: primaryColorDark,
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Please fill the input below  .",
                    style: TextStyle(
                      color: primaryColorDark,
                      fontSize: width * 0.04,
                      // fontWeight: FontWeight.bold,s
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: name,
                    autofillHints: const [AutofillHints.name],
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColorLight),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColorDark),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      hintText: 'Name',
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value!.length < 3) {
                        return "Enter at least 3 characters";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: email,
                    autofillHints: const [AutofillHints.email],
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColorLight),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColorDark),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    validator: (value) {
                      final bool isValid = EmailValidator.validate(value!);
                      if (!isValid) {
                        return "Enter a valid email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: password,
                    obscureText:
                        signUpWatch.registerPasswordVisible ? false : true,
                    autofillHints: const [AutofillHints.password],
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColorLight),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColorDark),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          signUpWatch.registerPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: primaryColorDark,
                        ),
                        onPressed: () {
                          signUpRead.registerPasswordVisibleFunction();
                        },
                      ),
                    ),
                    validator: (value) {
                      // Estimate the password's strength.
                      double strength = estimatePasswordStrength(value!);

                      // Print a response
                      if (strength < 0.3) {
                        return 'This password is weak!';
                      } else {
                        valueOfPassword = value;
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: rePassword,
                    obscureText:
                        signUpWatch.registerRePasswordVisible ? false : true,
                    autofillHints: const [AutofillHints.password],
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColorLight),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColorDark),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      hintText: 'Re-Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          signUpWatch.registerRePasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          signUpRead.registerRePasswordVisibleFunction();
                        },
                      ),
                    ),
                    validator: (value) {
                      // Estimate the password's strength.
                      double strength = estimatePasswordStrength(value!);

                      // Print a response
                      if (strength < 0.3) {
                        return 'This password is weak!';
                      } else if (valueOfPassword != value) {
                        return 'Passwords do not match';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: width * 0.12,
                  ),
                  CustomRadioButton(
                    elevation: 0,
                    absoluteZeroSpacing: true,
                    unSelectedColor: Theme.of(context).canvasColor,
                    buttonLables: const [
                      'User',
                      'Mechanic',
                    ],
                    buttonValues: const [
                      "User",
                      "Mechanic",
                    ],
                    buttonTextStyle: const ButtonTextStyle(
                        selectedColor: Colors.white,
                        unSelectedColor: Colors.black,
                        textStyle: TextStyle(fontSize: 16)),
                    radioButtonValue: (value) {
                      signUpRead.setRadioButtonText(value);
                      print(value);
                    },
                    selectedColor: Theme.of(context).colorScheme.secondary,
                  ),
                  SizedBox(
                    height: width * 0.12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          formKey.currentState!.validate();
                          FocusScope.of(context).unfocus();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                              fontSize: width * 0.05,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.09,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Already have an account?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: width * 0.04,
                              ),
                            ),
                            TextSpan(
                                text: '  Sign In',
                                style: TextStyle(
                                    color: primaryColorDark,
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pop(context);
                                  }),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
