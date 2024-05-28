import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notes_app/ui/widgets/blanks_for_style.dart/text_style.dart';

class NotesListWidget extends StatelessWidget {
  final String title;
  final String time;
  final Function onDeleteNote;

  const NotesListWidget({
    required this.title,
    required this.time,
    required this.onDeleteNote,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              color: getRandomPastelColor(),
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Slidable(
                    actionPane: const SlidableBehindActionPane(),
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        onTap: () {
                          onDeleteNote();
                        },
                        caption: 'Delete',
                        icon: Icons.delete,
                        color: Colors.red,
                      )
                    ],
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ListTile(
                                title: Text(
                                  title,
                                  style: appTextStyle.notesTextStyle,
                                ),
                              )
                            ]))),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 20),
                    child: Text(
                      time,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 15),
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }

  Color getRandomPastelColor() {
    final random = Random();
    final r = (random.nextInt(256) + 255) ~/ 2;
    final g = (random.nextInt(256) + 255) ~/ 2;
    final b = (random.nextInt(256) + 255) ~/ 2;
    return Color.fromRGBO(r, g, b, 1.0);
  }
}