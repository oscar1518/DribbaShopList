import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final Color color;

  const AppTextField(this.text, this.controller, this.color, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color, style: BorderStyle.solid, width: 2)),
      height: 50,
      padding: EdgeInsets.only(left: 20),
      margin: EdgeInsets.only(
        left: 30,
        bottom: 20,
        right: 30,
      ),
      child: Center(
        child: TextField(
          style: GoogleFonts.manrope(color: Colors.white),
          controller: controller,
          decoration: InputDecoration.collapsed(
              hintText: text, hintStyle: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
