import 'package:flutter/material.dart';
import 'package:notes_app/ui/widgets/blanks_for_style.dart/text_style.dart';

class NotesFieldWidget extends StatefulWidget {
  final TextEditingController controller;

  const NotesFieldWidget({super.key, required this.controller});

  @override
  _NotesFieldWidgetState createState() => _NotesFieldWidgetState();
}

class _NotesFieldWidgetState extends State<NotesFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          controller: widget.controller,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          style: appTextStyle.textStyle,
          autofocus: true,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            hintMaxLines: 1,
            hintText: 'Notes',
          ),
        ));
  }
}
