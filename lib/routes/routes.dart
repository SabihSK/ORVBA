import 'package:younusorvba/views/sign_in.dart';
import 'package:younusorvba/views/sign_up.dart';
import 'package:younusorvba/views/splash_screen.dart';
import 'package:younusorvba/views/user_view_detail.dart';
import 'package:younusorvba/views/user_view_list.dart';

getRoutes() {
  return {
    SplashScreen.route: (context) => const SplashScreen(),
    SignIn.route: (context) => const SignIn(),
    SignUp.route: (context) => const SignUp(),
    UserViewList.route: (context) => const UserViewList(),
    UserViewDetails.route: (context) => const UserViewDetails(),
  };
}
