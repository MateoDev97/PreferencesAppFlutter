import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage_app_flutter/preferences/custom_shared_preferences.dart';
import 'package:storage_app_flutter/providers/theme_provider.dart';
import 'package:storage_app_flutter/views/views.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CustomSharedPreferences.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                ThemeProvider(isDarkMode: CustomSharedPreferences.isDarkMode))
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeView.routeName,
      routes: {
        HomeView.routeName: (context) => const HomeView(),
        SettingsView.routeName: (context) => const SettingsView(),
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
