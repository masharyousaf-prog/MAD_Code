import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

// 1. THE STATE & STORAGE MANAGER
class SettingsProvider extends ChangeNotifier {
  // Internal state variables
  bool _notificationsEnabled = false;
  
  // We move the controller here so the UI can remain completely Stateless
  final TextEditingController nameController = TextEditingController();

  // Getters for the UI to read
  bool get notificationsEnabled => _notificationsEnabled;

  // Constructor automatically loads data when the app starts
  SettingsProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    
    // Read from disk, update state variables
    _notificationsEnabled = prefs.getBool('notifications') ?? false;
    nameController.text = prefs.getString('username') ?? '';
    
    // Tell the UI to redraw with the loaded data
    notifyListeners();
  }

  Future<void> updateUsername(String value) async {
    // 1. Save to physical disk in the background
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', value);
    
    // (Note: No need to call notifyListeners here because the TextField 
    // updates its own UI as you type, and the controller holds the text)
  }

  Future<void> toggleNotifications(bool value) async {
    // 1. Update internal state and UI immediately for a snappy feel
    _notificationsEnabled = value;
    notifyListeners(); 

    // 2. Save to physical disk in the background
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications', value);
  }
}

// 2. THE DISTRIBUTOR
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SettingsScreen());
  }
}

// 3. THE UI (Now completely Stateless)
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Consumer rebuilds when settings load or toggle
        child: Consumer<SettingsProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                TextField(
                  // The controller is now provided by our state manager
                  controller: provider.nameController,
                  decoration: const InputDecoration(labelText: 'Your Name'),
                  onChanged: (value) => provider.updateUsername(value),
                ),
                const SizedBox(height: 20),
                SwitchListTile(
                  title: const Text('Enable Notifications'),
                  value: provider.notificationsEnabled,
                  onChanged: (bool value) => provider.toggleNotifications(value),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}