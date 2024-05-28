import 'package:flutter/material.dart';

abstract class appTextStyle {
  static const textStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w300,
  );

static const textStyleForTable = TextStyle(
  color: Colors.white, fontWeight: FontWeight.w400, fontSize: 24);

 static const notesTextStyle =  TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w400,
  fontSize: 26);

 static const titleFieldStyle =  TextStyle(
  color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400);

static const appBarTextStyle =   TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w400,
  fontSize: 25);

}
