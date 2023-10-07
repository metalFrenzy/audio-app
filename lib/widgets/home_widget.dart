import 'package:audio_app/widgets/audio_widget.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import './likes_widget.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).header,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 15,
            ),
            Likes(S.of(context).audio1),
            Likes(S.of(context).audio2),
            Likes(S.of(context).audio3),
            const SizedBox(
              height: 20,
            ),
            AudioWidget(),
          ],
        ),
      ),
    );
  }
}
