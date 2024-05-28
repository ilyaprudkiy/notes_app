import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/ui/widgets/main_screen/main_screen_notes_cubit.dart';
import 'package:notes_app/ui/widgets/notes_screen/notes_screen.dart';
import 'package:notes_app/ui/widgets/notes_screen/notes_screen_cubit.dart';
import '../../ui/widgets/main_screen/main_screen_notes.dart';

class ScreenFactory {
  Widget makeMainScreen() {
    return BlocProvider(
      create: (context) => MainScreenNotesCubit([]),
      child: const MainScreenNotesWidget(),
      // lazy: false,
    );
  }

  Widget makeNotesScreen() {
    return BlocProvider<NotesScreenCubit>(
      create: (context) => NotesScreenCubit(const NotesScreenCubitState.initial()),
      child: const NoteScreenWidget(),
      // lazy: false,
    );
  }
}
