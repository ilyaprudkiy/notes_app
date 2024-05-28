import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/ui/widgets/blanks_for_style.dart/text_style.dart';
import 'main_screen_notes_cubit.dart';

class AppBarAddWidget extends StatefulWidget {
  final TextEditingController controller;

  const AppBarAddWidget({
    required this.controller,
  });

  @override
  _AppBarAddWidgetState createState() => _AppBarAddWidgetState();
}

class _AppBarAddWidgetState extends State<AppBarAddWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MainScreenNotesCubit>();
    return GestureDetector(
        onTap: () {
          // Снимаем фокус с текстового поля при касании за его пределами
          FocusScope.of(context).unfocus();
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Notes',
                    style: appTextStyle.appBarTextStyle,
                  ),
                  const SizedBox(width: 50),
                  Row(children: [
                    Container(
                        width: 230,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.1),
                            borderRadius: BorderRadius.circular(16)),
                        child: TextField(
                            onChanged: cubit.searchNote,
                            controller: widget.controller,
                            maxLength: 10,
                            maxLines: 1,
                            style: appTextStyle.textStyle,
                            autofocus: false,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(),
                              hintStyle: TextStyle(color: Colors.white),
                              hintMaxLines: 1,
                              icon: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 17, horizontal: 4),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  )),
                            )))
                  ])
                ])));
  }
}
