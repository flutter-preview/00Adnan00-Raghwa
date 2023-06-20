import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:raghwa/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

enum ScrollingList {
  none,
  right,
  left;
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<String> _photos = const [
    'assets/images/car_washing.png',
    'assets/images/furniture_washing.png',
    'assets/images/clothes_washing.png',
  ];

  late final Map<String, String> _backgroundPattern = {
    _photos[0]: 'assets/images/onboaring_background_pattern_1.png',
    _photos[1]: 'assets/images/onboaring_background_pattern_2.png',
    _photos[2]: 'assets/images/onboaring_background_pattern_3.png',
  };

  late final Map<String, String> _titles = {
    _photos[0]: 'غسيل سيارات',
    _photos[1]: 'غسيل مفروشات',
    _photos[2]: 'غسيل ملابس',
  };

  late final Map<String, String> _description = {
    _photos[0]: 'Lorem ipsum dolor sit amet consectetur scelerisque. Lorem ipsum dolor sit amet consectetur scelerisque.',
    _photos[1]: 'Lorem ipsum dolor sit amet consectetur scelerisque. Lorem ipsum dolor sit amet consectetur scelerisque.',
    _photos[2]: 'Lorem ipsum dolor sit amet consectetur scelerisque. Lorem ipsum dolor sit amet consectetur scelerisque.',
  };

  final _pageController = PageController();

  int _currentPageIndex = 0;

  var scrollingList = ScrollingList.none;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Column(
          verticalDirection: VerticalDirection.down,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _photos.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: _currentPageIndex == index ? Theme.of(context).primaryColor : const Color.fromRGBO(232, 230, 230, 1),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: height * 0.42,
              height: (height * 0.06).clamp(45, 60),
              child: LayoutBuilder(builder: (context, constraints) {
                return PlatformElevatedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    final lastPageIndex = _photos.length - 1;
                    if (_currentPageIndex == lastPageIndex) {
                      SharedPreferences.getInstance().then((sharedPreferencesInstance) {
                        sharedPreferencesInstance.setBool('visitedOnBoarding', true);
                      });
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );
                      return;
                    }
                    _pageController.animateToPage(
                      _currentPageIndex + 1,
                      duration: const Duration(microseconds: 400),
                      curve: Curves.linear,
                    );
                  },
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Text(
                        _currentPageIndex == _photos.length - 1 ? 'أبدأ مع رغوة!' : 'التالي',
                        style: TextStyle(
                          fontSize: constraints.maxHeight * (Platform.isIOS ? 0.8 : 0.35),
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    },
                  ),
                  material: (context, platform) => MaterialElevatedButtonData(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          (constraints.maxHeight * 0.33).clamp(16, 23),
                        ),
                      ),
                    ),
                  ),
                  cupertino: (context, platform) => CupertinoElevatedButtonData(
                    borderRadius: BorderRadius.circular(
                      (constraints.maxHeight * 0.33).clamp(16, 23),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(
              height: (height * 0.12).clamp(80, 140),
              child: Image.asset(
                'assets/images/bottom_bubbles.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          children: _photos
              .map(
                (photo) => Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        color: Theme.of(context).primaryColor,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return Center(
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 700),
                                opacity: _currentPageIndex == _photos.indexOf(photo) ? 1.0 : 0.0,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    FractionallySizedBox(
                                      heightFactor: 0.75,
                                      child: Image.asset(_backgroundPattern[photo]!),
                                    ),
                                    FractionallySizedBox(
                                      heightFactor: 0.5,
                                      alignment: const Alignment(0, 0.3),
                                      child: Image.asset(photo),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: LayoutBuilder(builder: (context, constraints) {
                          return AnimatedOpacity(
                            duration: const Duration(milliseconds: 600),
                            opacity: _currentPageIndex == _photos.indexOf(photo) ? 1.0 : 0.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _titles[photo]!,
                                  style: TextStyle(
                                    fontSize: (constraints.maxHeight * 0.08).clamp(16, 30),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: height * 0.04),
                                  child: Text(
                                    _description[photo]!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: (constraints.maxHeight * 0.06).clamp(12, 24),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
