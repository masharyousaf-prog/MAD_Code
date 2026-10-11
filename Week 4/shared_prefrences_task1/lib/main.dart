import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  ThemeProvider() {
    loadTheme();
  }

  Future<void> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDark = prefs.getBool('isDark') ?? false;
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isCurrentlyDark = themeMode == ThemeMode.dark;
    
    themeMode = isCurrentlyDark ? ThemeMode.light : ThemeMode.dark;
    await prefs.setBool('isDark', !isCurrentlyDark);
    
    notifyListeners();
  }
}

final themeProvider = ThemeProvider();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeProvider,
      builder: (context, child) {
        return MaterialApp(
          title: 'Theme Demo',
          theme: ThemeData.light(), 
          darkTheme: ThemeData.dark(), 
          themeMode: themeProvider.themeMode, 
          home: const HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeProvider,
      builder: (context, child) {
        bool isDark = themeProvider.themeMode == ThemeMode.dark;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Theme Switcher'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isDark ? 'Dark Mode Active' : 'Light Mode Active',
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    themeProvider.toggleTheme();
                  },
                  child: Text(isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}