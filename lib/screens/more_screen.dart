import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/settings_provider.dart';

class MoreScreen extends StatefulWidget {
  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  bool isArabic = false;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 30),
            child: Text(
              'settings',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 30),
          Divider(
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('Arabic'),
              ),
              Switch(
                activeColor: Colors.blue,
                value: isArabic,
                onChanged: (value) {
                  isArabic = value;
                  if (isArabic == true) {
                    settings.setlocale(Locale('ar'));
                  } else {
                    settings.setlocale(Locale('en'));
                  }
                },
              ),
            ],
          ),
          Divider(
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('Dark mode'),
              ),
              Switch(
                activeColor: Colors.blue,
                value: isDark,
                onChanged: (value) {
                  isDark = value;
                  settings.toggleTheme();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
