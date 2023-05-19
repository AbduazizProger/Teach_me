import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider extends InheritedWidget {
  const PreferencesProvider({
    super.key,
    required this.child,
    required this.data,
  }) : super(child: child);

  final Widget child;
  final SharedPreferences data;

  static PreferencesProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PreferencesProvider>();
  }

  @override
  bool updateShouldNotify(PreferencesProvider oldWidget) {
    return true;
  }
}
