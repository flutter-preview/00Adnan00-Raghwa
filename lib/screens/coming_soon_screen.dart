import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:raghwa/widgets/bubbles_background.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Directionality(
          textDirection: TextDirection.ltr,
          child: PlatformAppBar(
            cupertino: (_, __) => CupertinoNavigationBarData(
              backgroundColor: Colors.transparent,
            ),
            material: (_, __) => MaterialAppBarData(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(
                color: Colors.white,
                size: 26,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Image.asset(
                'assets/images/blured_bubble.png',
                height: 240,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.9, -0.7),
            child: Image.asset(
              'assets/images/bubble.png',
              height: height * 0.18,
            ),
          ),
          Align(
            alignment: const Alignment(-0.9, -0.48),
            child: Image.asset(
              'assets/images/bubble.png',
              height: height * 0.09,
            ),
          ),
          Align(
            alignment: const Alignment(-0.54, -0.11),
            child: Image.asset(
              'assets/images/bubble.png',
              height: height * 0.04,
            ),
          ),
          Align(
            alignment: const Alignment(-0.85, 0.9),
            child: Image.asset(
              'assets/images/bubble.png',
              height: height * 0.09,
            ),
          ),
          Align(
            alignment: const Alignment(-0.7, 0.33),
            child: Image.asset(
              'assets/images/bubble.png',
              height: height * 0.07,
            ),
          ),
          Align(
            alignment: const Alignment(0.15, -0.28),
            child: Image.asset(
              'assets/images/bubble.png',
              height: height * 0.02,
            ),
          ),
          Align(
            alignment: const Alignment(0.65, 0),
            child: Image.asset(
              'assets/images/bubble.png',
              height: height * 0.025,
            ),
          ),
          Align(
            alignment: const Alignment(0.5, 0.28),
            child: Image.asset(
              'assets/images/bubble.png',
              height: height * 0.02,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox.square(
              dimension: height * 0.2,
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'قريــبـاً...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: height * 0.065,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Container(
                            margin: const EdgeInsets.only(top: 10, left: 4),
                            height: constraints.maxHeight * 0.05,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(1000),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.only(top: 10, left: 4),
                            height: constraints.maxHeight * 0.05,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(1000),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.only(top: 10, left: 4),
                            height: constraints.maxHeight * 0.05,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(1000),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            height: constraints.maxHeight * 0.05,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(1000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
