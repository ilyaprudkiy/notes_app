import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/ui/navigation/navigation.dart';
import 'package:notes_app/ui/widgets/notes_screen/notes_screen_cubit.dart';
import 'package:notes_app/ui/widgets/notes_screen/save_or_not.dart';
import 'package:notes_app/ui/widgets/notes_screen/title_field_widget.dart';
import 'package:provider/provider.dart';

import 'app_bar_navigation_widget.dart';
import 'notes_field_widget.dart';

class NoteScreenWidget extends StatefulWidget {
  const NoteScreenWidget({super.key});

  @override
  State<NoteScreenWidget> createState() => _NoteScreenWidgetState();
}

class _NoteScreenWidgetState extends State<NoteScreenWidget> {
  final titleController = TextEditingController();
  final notesController = TextEditingController();
  late int index = -1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      index = ModalRoute.of(context)?.settings.arguments as int;
      context.read<NotesScreenCubit>().getNote(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<NotesScreenCubit>();
    titleController.text = cubit.state.title;
    notesController.text = cubit.state.notes;
    return Scaffold(
      backgroundColor: Colors.white12,
      body: BlocBuilder<NotesScreenCubit, NotesScreenCubitState>(
        builder: (context, state) {
          return ListView(
            children: [
              AppBarNavigation(
                onSaveNote: () {
                  cubit.saveNote(titleController.text, notesController.text,
                      index: index);
                  Navigator.of(context)
                      .pushNamed(MainNavigationRouteNames.mainScreen);
                },
                onSaveAndDiscord: () {
                  if (titleController.text != state.title ||
                      notesController.text != state.notes) {
                    cubit.saveClicked(
                      title: titleController.text,
                      note: notesController.text,
                    );
                  } else {
                    Navigator.of(context).pop();
                  }
                },
              ),
              TitleField(controller: titleController),
              NotesFieldWidget(controller: notesController),
              if (state.canTable) ...[
                const SizedBox(height: 20),
                SaveOrNotWidget(
                  onSaveNote: () {
                    cubit.saveNote(titleController.text, notesController.text,
                        index: index);
                    Navigator.of(context)
                        .pushNamed(MainNavigationRouteNames.mainScreen);
                  },
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
