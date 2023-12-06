import 'dart:math';

import 'package:flutter/material.dart';

class PageA extends StatefulWidget {
  @override
  _PageAState createState() => _PageAState();
}

class _PageAState extends State<PageA> with TickerProviderStateMixin {
  final List<AnimationController> _controllers = [];
  final List<Animation<double>> _animations = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 500; i++) {
      final controller = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this,
      )..repeat(reverse: true);
      final animation =
          Tween<double>(begin: Random().nextDouble() * -100.0, end: Random().nextDouble() * 100.0).animate(controller);
      _controllers.add(controller);
      _animations.add(animation);
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Horizontal Animation List')),
      body: Row(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _animations.length,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _animations[index],
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(_animations[index].value + 100, 0),
                      child: ListTile(
                        title: Text('Item ${index + 1}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _animations.length,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _animations[index],
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(_animations[index].value + 100, 0),
                      child: ListTile(
                        title: Text('Item ${index + 1}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _animations.length,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _animations[index],
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(_animations[index].value + 100, 0),
                      child: ListTile(
                        title: Text('Item ${index + 1}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _animations.length,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _animations[index],
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(_animations[index].value + 100, 0),
                      child: ListTile(
                        title: Text('Item ${index + 1}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _animations.length,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _animations[index],
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(_animations[index].value + 100, 0),
                      child: ListTile(
                        title: Text('Item ${index + 1}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
