import 'package:flutter/material.dart';
import 'package:flutter_wondersworld_ui/data/memory_wonders_world.dart';
import 'package:flutter_wondersworld_ui/domain/models/wonders_world.dart';
import 'package:flutter_wondersworld_ui/ui/screens/home/widgets/image_back.dart';
import 'package:flutter_wondersworld_ui/ui/screens/home/widgets/image_info.dart';
import 'package:flutter_wondersworld_ui/ui/screens/home/widgets/wondersworld_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WonderWorld _selected = wondersworld.last;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final topCardHeight = size.height / 2;
    const listHeight = 160.0;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            width: size.width,
            height: topCardHeight,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 700),
              child: ImageBack(
                key: Key(_selected.name),
                wonderWorld: _selected,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: topCardHeight - listHeight / 3,
            height: listHeight,
            child: WondersWorldList(
              onSelected: (value) {
                setState(
                  () {
                    _selected = value;
                  },
                );
              },
            ),
          ),
          Positioned(
            top: topCardHeight - listHeight / 3 + listHeight,
            left: 0,
            right: 0,
            bottom: 0,
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recomendation',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ImageData(),
                    ImageData(),
                    ImageData(),
                    ImageData()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
