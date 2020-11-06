import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ParallelNano_Bobby_Mobile/ui/screens/home.dart';
import 'package:ParallelNano_Bobby_Mobile/ui/screens/ip.dart';
import 'package:ParallelNano_Bobby_Mobile/ui/theme/theme.dart';
import 'package:ParallelNano_Bobby_Mobile/ui/theme/theme_notifier.dart';

/// Main.
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// Forces the screen to be always in portrait mode
  /// (no landscape mode when phone is turned).
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  /// Runs the app with the previously saved theme.
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]).then((_) {
    SharedPreferences.getInstance().then((prefs) {
      var darkModeOn = prefs.getBool('darkMode') ?? true;
      runApp(
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(darkModeOn ? darkTheme : lightTheme),
          child: MonitoringApp(),
        ),
      );
    });
  });
}

class MonitoringApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parallel Monitor',
      theme: themeNotifier.getTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => IPScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
