import 'package:flutter/material.dart';
import 'package:storage_app_flutter/views/views.dart';

class SideMenuWidget extends StatelessWidget {
  const SideMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),
          ListTile(
            leading: const Icon(Icons.pages_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeView.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.people_alt_rounded),
            title: const Text('People'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pushReplacementNamed(context, SettingsView.routeName);
            },
          )
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader();

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/menu.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(),
    );
  }
}
