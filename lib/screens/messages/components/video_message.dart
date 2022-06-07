import 'package:flutter/material.dart';

import '../../../constants.dart';

class VideoMessage extends StatelessWidget {
  const VideoMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              child: Image.asset("assets/images/Video Place Here.png"),
              borderRadius: BorderRadius.circular(8),
            ),
            Container(
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.play_arrow,
                size: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
