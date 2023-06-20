import 'dart:math';

import 'package:flutter/material.dart';

class BubblePainter extends CustomPainter {
  final List<Offset> bubblePositions;

  BubblePainter(this.bubblePositions);

  @override
  void paint(Canvas canvas, Size size) {
    // Draw bubbles at their current positions
    for (final bubblePosition in bubblePositions) {
      canvas.drawCircle(
        bubblePosition,
        20.0,
        Paint()..color = Colors.blue,
      );
    }
  }

  @override
  bool shouldRepaint(BubblePainter oldDelegate) => oldDelegate.bubblePositions != bubblePositions;
}

class BubbleScreen extends StatefulWidget {
  @override
  _BubbleScreenState createState() => _BubbleScreenState();
}

class _BubbleScreenState extends State<BubbleScreen> with TickerProviderStateMixin {
  // List of positions for each bubble
  List<Offset> _bubblePositions = [];

  // Animation controller to update bubble positions
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // Initialize bubble positions
    _bubblePositions = [
      const Offset(50.0, 50.0),
      const Offset(150.0, 100.0),
      const Offset(200.0, 200.0),
      const Offset(100.0, 250.0),
    ];

    // Initialize animation controller to update bubble positions every second
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )
      ..addListener(() {
        _updateBubblePositions();
      })
      ..repeat(period: Duration(seconds: 2));
  }

  @override
  void dispose() {
    // Dispose of animation controller when screen is closed
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BubblePainter(_bubblePositions),
      ),
    );
  }

  void _updateBubblePositions() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    setState(() {
      // Update bubble positions by adding random offsets to their current positions
      _bubblePositions = _bubblePositions.map((position) {
        final randomOffset = Offset(
          Random().nextInt(21) - 10.0,
          Random().nextInt(21) - 10.0,
        );

        // Check if bubble is going beyond the edges of the screen
        final newPosition = position + randomOffset;
        final isOffLeftEdge = newPosition.dx < 0;
        final isOffRightEdge = newPosition.dx > screenWidth;
        final isOffTopEdge = newPosition.dy < 0;
        final isOffBottomEdge = newPosition.dy > screenHeight;

        // Adjust position if bubble is going beyond the edges of the screen
        if (isOffLeftEdge || isOffRightEdge || isOffTopEdge || isOffBottomEdge) {
          final x = isOffLeftEdge
              ? 0.0
              : isOffRightEdge
                  ? screenWidth
                  : newPosition.dx;
          final y = isOffTopEdge
              ? 0.0
              : isOffBottomEdge
                  ? screenHeight
                  : newPosition.dy;
          return Offset(x, y);
        } else {
          return newPosition;
        }
      }).toList();
    });
  }
}
