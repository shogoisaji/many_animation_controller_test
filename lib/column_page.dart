import 'package:flutter/material.dart';

class ColumnPage extends StatefulWidget {
  final int count; // 100 or 1000 or 10000

  const ColumnPage({super.key, required this.count});
  @override
  ColumnPageState createState() => ColumnPageState();
}

class ColumnPageState extends State<ColumnPage> with TickerProviderStateMixin {
  final List<AnimationController> _controllers = [];
  final List<Animation<double>> _animations = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.count; i++) {
      final controller = AnimationController(
        duration: const Duration(seconds: 3),
        vsync: this,
      )..repeat(reverse: true);
      final animation = Tween<double>(begin: 0.0, end: 100.0).animate(controller);
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
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(
            'column:${widget.count}',
          )),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(_animations.length, (index) {
            return Row(
              children: [
                Expanded(
                  child: AnimatedBuilder(
                    animation: _animations[index],
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(_animations[index].value, 0),
                        child: Text('${index + 1}'),
                      );
                    },
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
