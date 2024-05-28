import 'package:flutter/material.dart';
import '../../domain/screen_factory/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const mainScreen = 'main_screen';
  static const notesScreen = 'main_screen/notes_screen';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.mainScreen: (_) => _screenFactory.makeMainScreen(),
    MainNavigationRouteNames.notesScreen: (_) => _screenFactory.makeNotesScreen(),
  };
}