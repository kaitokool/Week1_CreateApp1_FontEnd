import 'dart:convert' show json;

import 'package:create_login_singup_1/Screens/Welcome/Login/login_screen.dart';
import 'package:create_login_singup_1/Screens/Welcome/Signup/components/background.dart';
import 'package:create_login_singup_1/Screens/Welcome/Signup/components/or_divider.dart';
import 'package:create_login_singup_1/Screens/Welcome/Signup/components/social_icon.dart';
import 'package:create_login_singup_1/components/already_have_an_account_acheck.dart';
import 'package:create_login_singup_1/components/rounded_button.dart';
import 'package:create_login_singup_1/components/rounded_input_field.dart';
import 'package:create_login_singup_1/components/rounded_password_field.dart';
import 'package:create_login_singup_1/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController namectr = TextEditingController();
    TextEditingController passctr = TextEditingController();

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
              name: namectr,
              hinText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordFeild(
              pass: passctr,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () => RegisterUser(namectr.text, passctr.text),
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
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void RegisterUser(String namectr, String passctr) async {
    
    var url = "https://vgaminggear.000webhostapp.com/register.php";

    var res = await http.post(url, body: {"username": namectr, "password": passctr});

    var data = json.decode(res.body);

    if (data == "Loi") {
      Fluttertoast.showToast(
          msg: "This User Already Exit!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Registration Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
