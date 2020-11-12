import 'package:create_login_singup_1/Screens/Welcome/Login/login_screen.dart';
import 'package:create_login_singup_1/Screens/Welcome/Signup/components/background.dart';
import 'package:create_login_singup_1/Screens/Welcome/Signup/components/or_divider.dart';
import 'package:create_login_singup_1/Screens/Welcome/Signup/components/social_icon.dart';
import 'package:create_login_singup_1/components/already_have_an_account_acheck.dart';
import 'package:create_login_singup_1/components/rounded_button.dart';
import 'package:create_login_singup_1/components/rounded_input_field.dart';
import 'package:create_login_singup_1/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundInputField(
              hinText: "Your Email",
              onChanged: (value) {},
            ),
            RoundInputField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: (){},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: (){},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: (){},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}