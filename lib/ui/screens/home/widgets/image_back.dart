import 'package:flutter/material.dart';
import 'package:flutter_wondersworld_ui/domain/models/wonders_world.dart';

class ImageBack extends StatefulWidget {
  const ImageBack({
    Key? key,
    required this.wonderWorld,
  }) : super(key: key);
  final WonderWorld wonderWorld;
  @override
  State<ImageBack> createState() => _ImageBackState();
}

class _ImageBackState extends State<ImageBack>
    with SingleTickerProviderStateMixin {
  final _movement = -100.0;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Stack(
          children: [
            Positioned.fill(
              left: _movement * _controller.value,
              right: _movement * (1 - _controller.value),
              child: Image.asset(
                widget.wonderWorld.imageBack,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 40,
              left: 10,
              right: 10,
              height: 100,
              child: FittedBox(
                child: Text(
                  widget.wonderWorld.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              left: _movement * _controller.value,
              right: _movement * (1 - _controller.value),
              child: Image.asset(
                widget.wonderWorld.imageFront,
                fit: BoxFit.cover,
              ),
            ),
          ],
        );
      },
    );
  }
}
