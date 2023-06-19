import 'package:flutter/material.dart';
import 'package:storage_app_flutter/widgets/widgets.dart';
import 'package:storage_app_flutter/preferences/custom_shared_preferences.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = 'homeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const SideMenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('isDarkMode: ${CustomSharedPreferences.isDarkMode}'),
          const Divider(),
          Text(
              'Gender: ${(CustomSharedPreferences.gender) == 1 ? 'Male' : 'Female'}'),
          const Divider(),
          Text('User name: ${CustomSharedPreferences.name}'),
        ],
      ),
    );
  }
}
