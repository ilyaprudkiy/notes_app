import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../domain/entity/notes.dart';

class MainScreenNotesCubitState {}

class MainScreenNotesCubit extends Cubit<List<Notes>> {
  MainScreenNotesCubit(super.initialState);

  Future<void> searchNote(String text) async {
    final newList = <Notes>[];
    if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(NotesAdapter());
    final box = await Hive.openBox<Notes>('notes_and_title');
    final notesList = box.values.toList();
    for (var note in notesList) {
      if (note.title.contains(text)) {
        newList.add(note);
      }
    }
    emit(newList);
    await box.close();
  }

  Future<void> deleteNotes(int index) async {
    if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(NotesAdapter());
    final box = await Hive.openBox<Notes>('notes_and_title');
    await box.deleteAt(index);
    emit(box.values.toList());
    await box.close();
  }

  Future<void> fetchNotes() async {
    if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(NotesAdapter());
    final box = await Hive.openBox<Notes>('notes_and_title');
    final notesList = box.values.toList();

    emit(notesList);
    await box.close();
  }
}
