import 'package:flutter/material.dart';
import 'package:notes_app/ui/widgets/blanks_for_style.dart/text_style.dart';
import '../../navigation/navigation.dart';
import '../blanks_for_style.dart/color.dart';

class SaveOrNotWidget extends StatelessWidget {
  final Function onSaveNote;

  const SaveOrNotWidget({
    super.key,
    required this.onSaveNote,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 300,
      height: 200,
      decoration: AppBoxDecoration.boxForTable,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 15,
            ),
            const IconInfoWidget(),
            const SizedBox(
              height: 20,
            ),
            const TextWidget(),
            RowSaveAndDiscordWidget(
              onSaveNote: onSaveNote,
            )
          ]),
    ));
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Text(
          'Save changes ?',
          style: appTextStyle.textStyleForTable,
        ));
  }
}

class IconInfoWidget extends StatelessWidget {
  const IconInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: const Icon(
              size: 25,
              Icons.info,
              color: Colors.white,
            )));
  }
}

class RowSaveAndDiscordWidget extends StatelessWidget {
  final Function onSaveNote;

  const RowSaveAndDiscordWidget({
    super.key,
    required this.onSaveNote,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(MainNavigationRouteNames.mainScreen);
              },
              child: const Text(
                'discord',
                style: appTextStyle.textStyle,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: () {
                onSaveNote();
              },
              child: const Text(
                'save',
                style: appTextStyle.textStyle,
              ),
            )
          ],
        ));
  }
}
