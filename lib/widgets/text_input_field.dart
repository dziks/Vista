import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'dart:io' show Platform;

Color primaryColor = Color.fromRGBO(49, 49, 147, 1);

class TextInputField extends StatelessWidget {
  final String Function(String) validator;
  final TextEditingController controller;
  final String initialValue;
  final Widget icon;
  final String placeholder;
  final InputBorder focusedBorder;
  final InputBorder enabledBorder;
  final bool obscureText;
  final Color cursorColor;
  final Color focusedColor;
  final Color labelStyleColor;
  final String labelText;
  final String hintText;
  final bool readOnly;
  final int maxLines;
  final IconButton suffixIcon;
  final Widget prefixIcon;
  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType textInputType;
  final TextInputType keyboardType;
  final void Function(String) onChanged;

  const TextInputField({
    Key key,
    this.validator,
    this.controller,
    this.icon,
    this.labelText,
    this.hintText,
    this.readOnly = false,
    this.maxLines = 1,
    this.textInputAction,
    this.inputFormatters,
    this.textInputType,
    this.keyboardType,
    this.onChanged,
    this.suffixIcon,
    this.obscureText = false,
    this.prefixIcon,
    this.initialValue,
    this.focusedBorder,
    this.enabledBorder,
    this.cursorColor,
    this.focusedColor,
    this.labelStyleColor,
    this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
            initialValue: initialValue,
            obscureText: obscureText,
            onChanged: onChanged,
            maxLines: maxLines,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            textInputAction: textInputAction,
            validator: validator,
            controller: controller,
            readOnly: readOnly,
            cursorColor: cursorColor,
            decoration: InputDecoration(
              // disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
              icon: icon,
              focusedBorder: focusedBorder,
              // OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
              enabledBorder: enabledBorder,
              // OutlineInputBorder(
              //   borderSide: BorderSide(width: 1, color: Colors.transparent),
              // ),
              suffixIcon: suffixIcon,
              focusColor: focusedColor,
              filled: true,
              labelText: labelText,
              labelStyle: TextStyle(
                color: labelStyleColor,
              ),
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              prefixIcon: prefixIcon,
            ),
          )
       ;
  }
}

class IosTextInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
   final TextInputType keyboardType;
   final String placeholder;
  const IosTextInputField({
    Key key,
    this.controller,
    this.obscureText = false, this.placeholder, this.keyboardType,
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

class DateInputField extends StatelessWidget {
  final String name;
  final InputType inputType;
  final Widget icon;
  final String labelText;
  final String hintText;
  final Decoration inputDecoration;
  final List<String Function(dynamic)> validators;
  final void Function(DateTime) onChanged;
  const DateInputField({
    Key key,
    this.name,
    this.inputType,
    this.icon,
    this.labelText,
    this.hintText,
    this.inputDecoration,
    this.onChanged,
    this.validators,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: FormBuilderDateTimePicker(
        name: name,
        onChanged: onChanged,
        inputType: inputType,
        // validators: validators,
        decoration: InputDecoration(
          filled: true,
          icon: icon,
          labelText: labelText,
          labelStyle: TextStyle(color: primaryColor),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
