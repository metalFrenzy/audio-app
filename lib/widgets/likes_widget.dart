import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/settings_provider.dart';

class Likes extends StatefulWidget {
  final String name;
  Likes(this.name);

  @override
  State<Likes> createState() => _LikesState();
}

class _LikesState extends State<Likes> {
  bool isfav = false;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        color: Theme.of(context).colorScheme.secondary,
        child: ListTile(
          title: Text(this.widget.name),
          trailing: IconButton(
            icon: isfav
                ? Icon(
                    Icons.favorite,
                    color: Colors.deepPurple,
                  )
                : Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.deepPurple,
                  ),
            onPressed: () {
              if (isfav == false) {
                setState(() {
                  isfav = true;
                });
              } else if (isfav == true) {
                setState(() {
                  isfav = false;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
