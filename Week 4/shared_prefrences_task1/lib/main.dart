import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class SharedProvider extends ChangeNotifier{
  bool _isLight = true;

  ThemeData get theme => _isLight ? ThemeData.light() : ThemeData.dark();
  bool get isLight => _isLight;

  Future<void> loadTheme() async{
    SharedPreferences pref= await SharedPreferences.getInstance();
    _isLight = pref.getBool("isLight") ?? true;
    notifyListeners();
  }

  Future<void> toggleTheme() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    _isLight = !_isLight;
    notifyListeners();
    await pref.setBool("isLight", _isLight);
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final provider = SharedProvider();
  await provider.loadTheme();

  runApp(
    ChangeNotifierProvider(
      create: (context) => SharedProvider(),
      child: const MyApp(),
      )
  );
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "prac theme", //context.watch<SharedProvider>().theme,
      theme: Provider.of<SharedProvider>(context, listen: true).theme,
      home: const Page1(),
    );
  }
}

class Page1 extends StatelessWidget{
  const Page1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("prac"),
      ),
      body: Column(
        children: [
          Consumer<SharedProvider>(
            builder: (context,provider, child){
              return ElevatedButton(
                child: Text(provider.isLight ? "Light Mode" : "Dark Mode"),
                onPressed: () {
                  provider.toggleTheme();
                },
              );
            },
            ),
        ],
      ),
    );
  }
}