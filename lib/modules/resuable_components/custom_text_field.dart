

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_api_abdallah/modules/resuable_components/resuable_components.dart';

import '../../network/local/cache_helper.dart';
import '../../shop_app/login/shop_login.dart';
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField ({super.key  ,
    required this.label,
    this.controller,
    this.suffixIcon,
    this.isPassword,
    this.prefixIcon,
    required this.validator,
required this.onSubmited,

    //onChanged
  }) ;
  String? label;
  TextEditingController? controller;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool? isPassword;
  String? Function(String?) validator;
  String? Function(String?) onSubmited;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: controller,
      obscureText: isPassword??false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black87,
            )
        ),
        labelText: label,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      validator: validator,
    );
  }

}
String token='';