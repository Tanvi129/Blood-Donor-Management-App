import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({ Key? key , required this.controller ,required this.hintText , required this.keyboardType , required this.obscureText}) : super(key: key);
final controller;
String? hintText;
TextInputType keyboardType;
 bool obscureText;
  @override
  Widget build(BuildContext context) {
   
    return   TextFormField(
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter some value";
                          }
                          return null;
                        },
                        keyboardType: keyboardType,
                        obscureText: obscureText,
                        controller: controller,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        decoration:  InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: hintText,
                          hintStyle: const TextStyle(
                            fontSize: 20,
                
                            color: Colors.grey
                          ),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                              width: 3,
                              color: Colors.black), //<-- SEE HERE
                        )));
  }
}