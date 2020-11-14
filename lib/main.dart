import 'package:ParallelNano_Bobby_Mobile/app/constants.dart';
import 'package:ParallelNano_Bobby_Mobile/app/nodes_handler.dart';
import 'package:ParallelNano_Bobby_Mobile/app/user_settings.dart';
import 'package:ParallelNano_Bobby_Mobile/ui/subscreens/nodes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ParallelNano_Bobby_Mobile/ui/screens/home.dart';
import 'package:ParallelNano_Bobby_Mobile/ui/screens/ip.dart';
import 'package:ParallelNano_Bobby_Mobile/ui/theme/theme.dart';
import 'package:ParallelNano_Bobby_Mobile/app/notifiers/theme_notifier.dart';

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
      var _darkModeOn = prefs.getBool('darkMode') ?? true;
      UserSettings().ipValue = prefs.getString(ip_value_key) ??
          ''; //TODO future builder in the right class
      runApp(
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(_darkModeOn ? darkTheme : lightTheme),
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
      initialRoute: '/nodes',
      routes: {
        '/': (context) => IPScreen(),
        '/home': (context) => HomeScreen(),
        '/nodes': (context) => NodesSubscreen(), //remove later
      },
    );
  }
}
