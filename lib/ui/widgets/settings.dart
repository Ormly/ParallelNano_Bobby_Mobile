import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ParallelNano_Bobby_Mobile/ui/screens/ip.dart';
import 'package:ParallelNano_Bobby_Mobile/ui/theme/theme.dart';
import 'package:ParallelNano_Bobby_Mobile/app/notifiers/theme_notifier.dart';

/// A StatefulWidget for a pop-up button.
///
/// It renders a pop-up button that opens the app's settings when pressed.
/// It contains three options, the selection of the Light Theme, Dark Theme and
/// the change IP button that sends the user to the IP screen.
class Settings extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Settings> {
  var _darkTheme = false;

  static const String FirstItem = 'Light';
  static const String SecondItem = 'Dark';
  static const String ThirdItem = 'Change IP';

  static const List<String> choices = <String>[
    FirstItem,
    SecondItem,
    ThirdItem,
  ];

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.settings,
        size: 30.0,
      ),
      onSelected: choiceAction,
      itemBuilder: (BuildContext context) {
        return choices.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }

  /// Decides what to do depending on the pressed choice.
  void choiceAction(String choice) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    if (choice == FirstItem) {
      _darkTheme = false;
      onThemeChanged(_darkTheme, themeNotifier);
    } else if (choice == SecondItem) {
      _darkTheme = true;
      onThemeChanged(_darkTheme, themeNotifier);
    } else if (choice == ThirdItem) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => IPScreen()),
      );
    }
  }

  /// Calls the notifier to select the theme.
  void onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(darkTheme)
        : themeNotifier.setTheme(lightTheme);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }
}
