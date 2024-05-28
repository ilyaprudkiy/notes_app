import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/ui/navigation/navigation.dart';
import 'package:notes_app/ui/widgets/main_screen/main_screen_notes_cubit.dart';
import 'app_bar_add_widget.dart';
import 'list_notes_widget.dart';

class MainScreenNotesWidget extends StatefulWidget {
  const MainScreenNotesWidget({super.key});

  @override
  State<MainScreenNotesWidget> createState() => _MainScreenNotesWidgetState();
}

class _MainScreenNotesWidgetState extends State<MainScreenNotesWidget> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<MainScreenNotesCubit>().fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white12,
        floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          backgroundColor: Colors.black54,
          foregroundColor: Colors.white,
          focusColor: Colors.white12,
          hoverColor: Colors.white12,
          onPressed: () => Navigator.of(context)
              .pushNamed(MainNavigationRouteNames.notesScreen, arguments: -1),
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  AppBarAddWidget(
                    controller: textController,
                  ),
                  const ListNotesWidget(),
                ]))); // в itemCount нужно будет добавить длинну файлов из моего хранилища
  }
}
