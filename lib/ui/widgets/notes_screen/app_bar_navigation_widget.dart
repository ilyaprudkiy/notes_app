import 'package:flutter/material.dart';

import '../blanks_for_style.dart/color.dart';

class AppBarNavigation extends StatelessWidget {
  final Function onSaveNote;
  final Function onSaveAndDiscord;

  const AppBarNavigation(
      {super.key, required this.onSaveNote, required this.onSaveAndDiscord});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Row(
          children: [
            Container(
                decoration: AppBoxDecoration.appBarBoxDecoration,
                child: IconButton(
                  onPressed: () {
                    onSaveAndDiscord();
                  },
                  icon: const Icon(
                    weight: 25,
                    size: 30,
                    Icons.chevron_left_outlined,
                    color: Colors.white,
                  ),
                )),
            const Spacer(),
            Container(
                decoration: AppBoxDecoration.appBarBoxDecoration,
                child: IconButton(
                    onPressed: () {
                      onSaveNote();
                    },
                    icon: const Icon(
                      size: 30,
                      Icons.save,
                      color: Colors.white,
                    ))),
          ],
        ));
  }
}
