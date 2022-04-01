import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    required this.icon,
    required this.hint,
    this.inputType,
    this.inputAction,
    this.inputController,
  });

  final IconData icon;
  final String hint;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final TextEditingController? inputController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 330.w,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.orange)),
      child: TextFormField(
        keyboardType: inputType,
        textInputAction: inputAction,
        controller: inputController,
         validator: (value) {
          if (value!.isEmpty) {
            return "Veuillez renseigner ce champs svp";
          }
          return null;
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: hint,

          labelStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.all(10),
          suffixIcon: Icon(
            icon,
            color: Colors.orange,
          ),
          // focusColor: Colors.orange
        ),
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
    );
  }
}


class PasswordInputField extends StatelessWidget {
  PasswordInputField({
    required this.icon,
    required this.hint,
    this.inputType,
    this.inputAction,
    this.inputController,
  });

  final IconData icon;
  final String hint;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final TextEditingController? inputController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 330.w,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.orange)),
      child: TextFormField(
        keyboardType: inputType,
        textInputAction: inputAction,
        controller: inputController,
        obscureText: true,
         validator: (value) {
          if (value!.isEmpty) {
            return "Veuillez renseigner ce champs svp";
          }
          return null;
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: hint,
          

          labelStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.all(10),
          suffixIcon: Icon(
            icon,
            color: Colors.orange,
          ),
          // focusColor: Colors.orange
        ),
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
    );
  }
}
