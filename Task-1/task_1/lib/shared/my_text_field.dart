import 'package:flutter/material.dart';

class MyTextFormFiels extends StatelessWidget {

  final TextEditingController controller;
  final String validname;
  final String label;
  final TextInputType inputType;
  VoidCallback function;
  bool obsecure = false;
  InputBorder? border = const OutlineInputBorder();
  Widget? sufficicon;
  MyTextFormFiels({
    Key? key,
    required this.controller,
    required this.label,
    required this.validname,
    required this.inputType,
    required this.function,
    required this.obsecure,
    this.border,
    this.sufficicon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecure,
      decoration: InputDecoration(
        hintText : label,
        border: border,
        contentPadding: const EdgeInsets.all(20),
        focusedBorder: border,
        suffixIcon: sufficicon
      ),
      keyboardType: inputType,
      validator: (value){
        if (value!.isEmpty) 
        {
          return '$validname must not be empty';
        } else {
          return null;
        }
      } ,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
    );
  }
}