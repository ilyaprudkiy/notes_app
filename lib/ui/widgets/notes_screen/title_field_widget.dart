import 'package:flutter/material.dart';

class TitleField extends StatefulWidget {
  final TextEditingController controller;

  const TitleField({super.key, required this.controller});

  @override
  _TitleFieldState createState() => _TitleFieldState();
}

class _TitleFieldState extends State<TitleField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextField(
          maxLines: 1,
          maxLength: 20,
          controller: widget.controller,
          style: const TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400),
          autofocus: true,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            hintMaxLines: 1,
            hintText: 'Title',
          ),
        ));
  }
}