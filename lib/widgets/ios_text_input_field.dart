import 'package:flutter/cupertino.dart';

class IosTextInputField extends StatelessWidget {
  final TextEditingController controller;
  final CupertinoIcons suffixIcon;
  final bool obscureText;
  final String placeholder;
 final TextInputType keyboardType;
  const IosTextInputField({
    Key key,
    this.controller,
    this.suffixIcon,
   this.obscureText = false,
     this.placeholder, this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      obscureText: obscureText,
      placeholder: placeholder,
      keyboardType: keyboardType,
    );
  }
}
