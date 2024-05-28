import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import '../../../domain/entity/notes.dart';

class NotesScreenCubitState {
  final String title;
  final String notes;
  final String time;
  final bool canTable;

  const NotesScreenCubitState.initial()
      : title = '',
        notes = '',
        canTable = false,
        time = '';

  NotesScreenCubitState({
    required this.time,
    required this.title,
    required this.notes,
    required this.canTable,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotesScreenCubitState &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          notes == other.notes &&
          canTable == other.canTable &&
          time == other.time;

  @override
  int get hashCode => title.hashCode ^ notes.hashCode ^ canTable.hashCode;

  NotesScreenCubitState copyWith({
    String? title,
    String? notes,
    String? time,
    bool? canTable,
  }) {
    return NotesScreenCubitState(
        title: title ?? this.title,
        notes: notes ?? this.notes,
        time: time ?? this.time,
        canTable: canTable ?? this.canTable);
  }
}

class NotesScreenCubit extends Cubit<NotesScreenCubitState> {
  NotesScreenCubit(super.initialState);

  void saveClicked({required String title, required String note}) {
    final newState = state.copyWith(title: title, notes: note, time: _getData(), canTable: true);
    emit(newState);
  }

  Future<void> getNote(int index) async {
    if (index != -1) {
      if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(NotesAdapter());
      final box = await Hive.openBox<Notes>('notes_and_title');
      final note = box.values.toList()[index];
      box.close();
      emit(state.copyWith(title: note.title, notes: note.notes, time: note.time));
    }
  }

  Future<void> saveNote(String title, String text, {int index = -1}) async {
    if (title.isEmpty && text.isEmpty) return;
    if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(NotesAdapter());

    final box = await Hive.openBox<Notes>('notes_and_title');
    final note = Notes(title: title, notes: text, time: _getData());
    if (index == -1) {
      await box.add(note);
    } else {
      await box.putAt(index, note);
    }

    await box.close();
  }

  String _getData() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm \n EEE d MMM').format(now);
    return formattedDate;
  }
}
