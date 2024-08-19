import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trial2/utils/colors.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final int height;
  final TextEditingController controller;
  const MyTextField(
      {super.key,
      required this.height,
      required this.hintText,
      required this.controller,
      required bool obscureText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextField(
        obscureText: false,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsetsDirectional.symmetric(vertical: 15.0),
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.hinttext, fontSize: 15),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.inputinactive)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.green1)),
          filled: true,
          fillColor: AppColors.inputinactive,
        ),
      ),
    );
  }
}
