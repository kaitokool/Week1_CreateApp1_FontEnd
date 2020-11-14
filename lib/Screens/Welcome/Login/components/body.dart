import 'dart:convert';

import 'package:create_login_singup_1/Screens/Welcome/Login/components/background.dart';
import 'package:create_login_singup_1/Screens/Welcome/Signup/signup_screen.dart';
import 'package:create_login_singup_1/Screens/Welcome/welcome_screen.dart';
import 'package:create_login_singup_1/components/already_have_an_account_acheck.dart';
import 'package:create_login_singup_1/components/rounded_button.dart';
import 'package:create_login_singup_1/components/rounded_input_field.dart';
import 'package:create_login_singup_1/components/rounded_password_field.dart';
import 'package:create_login_singup_1/components/text_field_container.dart';
import 'package:create_login_singup_1/constants.dart';
import 'package:create_login_singup_1/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();

  const Body({
    Key key,
  }) : super(key: key);

}

class _BodyState extends State<Body> {
  Future Login(String namectr, String passctr) async {
    var url = "https://vgaminggear.000webhostapp.com/login.php";

    var res = await http.post(
      url,
      body: {
        "username": namectr,
        "password": passctr,
      },
    );

    var data = json.decode(res.body);

    if (data == "OK") {
      Fluttertoast.showToast(
          msg: "Login Successfully!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp(),));
    } else {
      Fluttertoast.showToast(
          msg: "Username & Password Incorrect!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

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
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.3,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundInputField(
              hinText: "Your Email",
              onChanged: (value) {},
              name: namectr,
            ),
            RoundedPasswordFeild(
              pass: passctr,
              onChanged: (value) {},
            ),
            RoundedButton(
                text: "LOGIN", press: () => Login(namectr.text, passctr.text)),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
