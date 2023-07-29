import 'package:flutter/material.dart';
import 'package:flutter_wondersworld_ui/data/memory_wonders_world.dart';
import 'package:flutter_wondersworld_ui/domain/models/wonders_world.dart';

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
                    ImageInfo(),
                    ImageInfo(),
                    ImageInfo(),
                    ImageInfo()
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

class ImageInfo extends StatelessWidget {
  const ImageInfo({
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

class WondersWorldList extends StatefulWidget {
  const WondersWorldList({
    Key? key,
    this.onSelected,
  }) : super(key: key);
  final ValueChanged<WonderWorld>? onSelected;
  @override
  State<WondersWorldList> createState() => _WondersWorldListState();
}

class _WondersWorldListState extends State<WondersWorldList> {
  final _animatedListKey = GlobalKey<AnimatedListState>();
  final _pageController = PageController();
  double page = 0.0;

  void _listenScroll() {
    setState(() {
      page = _pageController.page ?? 0;
    });
  }

  @override
  void initState() {
    _pageController.addListener(_listenScroll);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_listenScroll);
    _pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _animatedListKey,
      controller: _pageController,
      physics: const PageScrollPhysics(parent: BouncingScrollPhysics()),
      scrollDirection: Axis.horizontal,
      initialItemCount: wondersworld.length,
      itemBuilder: (context, index, animation) {
        final images = wondersworld[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              widget.onSelected!(images);
            },
            child: SizedBox(
              width: 140,
              height: 150,
              child: Image(
                image: AssetImage(images.imageBack),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          left: _movement,
          right: _movement,
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
          left: _movement,
          right: _movement,
          child: Image.asset(
            widget.wonderWorld.imageFront,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
