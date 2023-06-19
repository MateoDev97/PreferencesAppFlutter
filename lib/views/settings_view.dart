import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage_app_flutter/preferences/custom_shared_preferences.dart';
import 'package:storage_app_flutter/providers/theme_provider.dart';
import 'package:storage_app_flutter/widgets/widgets.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  static const String routeName = 'settingsView';

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const SideMenuWidget(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Settings',
                style: TextStyle(fontSize: 42),
              ),
              const Divider(),
              SwitchListTile.adaptive(
                value: CustomSharedPreferences.isDarkMode,
                title: const Text('Dark Mode'),
                onChanged: (value) {
                  CustomSharedPreferences.isDarkMode = value;
                  ThemeProvider(isDarkMode: value).setDarkMode();

                  final themeProvider =
                      Provider.of<ThemeProvider>(context, listen: false);

                  value
                      ? themeProvider.setDarkMode()
                      : themeProvider.setLightMode();

                  setState(() {});
                },
              ),
              const Divider(),
              RadioListTile<int>(
                value: 1,
                groupValue: CustomSharedPreferences.gender,
                title: const Text('Male'),
                onChanged: (value) {
                  CustomSharedPreferences.gender = value ?? 1;
                  setState(() {});
                },
              ),
              const Divider(),
              RadioListTile<int>(
                value: 2,
                groupValue: CustomSharedPreferences.gender,
                title: const Text('Female'),
                onChanged: (value) {
                  CustomSharedPreferences.gender = value ?? 2;
                  setState(() {});
                },
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: CustomSharedPreferences.name,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    helperText: 'User name',
                  ),
                  onChanged: (value) {
                    CustomSharedPreferences.name = value;
                    setState(() {});
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
