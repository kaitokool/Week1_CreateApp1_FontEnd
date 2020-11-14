import 'package:create_login_singup_1/components/text_field_container.dart';
import 'package:create_login_singup_1/constants.dart';
import 'package:flutter/material.dart';

class RoundedPasswordFeild extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController pass;
  const RoundedPasswordFeild({
    Key key,
    this.onChanged,
    this.pass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: pass,
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
