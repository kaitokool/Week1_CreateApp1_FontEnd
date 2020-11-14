import 'package:create_login_singup_1/components/text_field_container.dart';
import 'package:create_login_singup_1/constants.dart';
import 'package:flutter/material.dart';

class RoundInputField extends StatelessWidget {
  final String hinText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController name;
  const RoundInputField({
    Key key,
    this.hinText,
    this.icon = Icons.person,
    this.onChanged,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: name,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hinText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
