import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:younusorvba/constants/colors_of_app.dart';
import 'package:younusorvba/provider/internet_check_provider.dart';
import 'package:younusorvba/provider/sign_in_provider.dart';
import 'package:younusorvba/views/sign_up.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

class SignIn extends StatefulWidget {
  static const route = "/SignIn";
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();

//?-----Functions--------

//*------Net Connection Check-----
  netCheck() async {
    bool netResul =
        await context.read<InterNetCheckProvier>().netCheck(context);
    return netResul;
  }

//?-----Functions--------

//?-----Text Editing Controller--------
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
//?-----Text Editing Controller--------

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

//?-----Provider--------
    var signInRead = context.read<SignInProvider>();
    var signInWatch = context.watch<SignInProvider>();
//?-----Provider--------

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.09,
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
                    height: height * 0.09,
                  ),
                  Text(
                    "Login",
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
                    "Please sign in to continue.",
                    style: TextStyle(
                      color: primaryColorDark,
                      fontSize: width * 0.04,
                    ),
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
                    obscureText: signInWatch.passwordVisible ? false : true,
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
                          signInWatch.passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: primaryColorDark,
                        ),
                        onPressed: () {
                          signInRead.passwordVisibleFunction();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          bool a = await netCheck();
                          if (a) {
                            signInRead.loginButton(
                                context, formKey.currentState!.validate());
                          }
                          FocusScope.of(context).unfocus();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "LOGIN",
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
                    height: width * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontSize: width * 0.05,
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
                              text: 'Dont have an account?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: width * 0.04,
                              ),
                            ),
                            TextSpan(
                                text: '  Sign Up',
                                style: TextStyle(
                                    color: primaryColorDark,
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, SignUp.route);
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
