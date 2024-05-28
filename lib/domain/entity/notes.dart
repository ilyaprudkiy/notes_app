import 'package:hive/hive.dart';

part 'notes.g.dart';

@HiveType(typeId: 1)
class Notes {
  @HiveField(0)
  String title;

  @HiveField(1)
  String notes;

  @HiveField(2)
  String time;

  Notes({required this.title, required this.notes, required this.time});
}
