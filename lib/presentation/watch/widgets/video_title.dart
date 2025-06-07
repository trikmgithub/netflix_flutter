import 'package:flutter/cupertino.dart';

class VideoTitle extends StatelessWidget {
  final String title;
  const VideoTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
