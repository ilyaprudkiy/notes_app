import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entity/notes.dart';
import '../../navigation/navigation.dart';
import 'main_screen_notes_cubit.dart';
import 'notes_list_widget.dart';

class ListNotesWidget extends StatelessWidget {
  const ListNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MainScreenNotesCubit>();
    return BlocBuilder<MainScreenNotesCubit, List<Notes>>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            itemCount: state.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                      MainNavigationRouteNames.notesScreen,
                      arguments: index);
                },
                child: NotesListWidget(
                  title: state[index].title,
                  time: state[index].time,
                  onDeleteNote: () {
                    cubit.deleteNotes(index);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
