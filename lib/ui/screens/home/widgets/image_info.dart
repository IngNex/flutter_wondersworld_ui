import 'package:flutter/material.dart';
import 'package:flutter_wondersworld_ui/data/memory_wonders_world.dart';

class ImageData extends StatelessWidget {
  const ImageData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image(
            width: 80,
            height: 80,
            fit: BoxFit.cover,
            image: AssetImage(wondersworld[0].imageBack),
          ),
          const SizedBox(width: 10),
          const Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'MON, 11 DIC 13 20',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 10),
              Text(
                'Nice days in a good place',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                'Fly ticket',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
