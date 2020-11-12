import 'package:create_login_singup_1/components/text_field_container.dart';
import 'package:create_login_singup_1/constants.dart';
import 'package:flutter/material.dart';

class RoundedPasswordFeild extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordFeild({
    Key key, this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
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
