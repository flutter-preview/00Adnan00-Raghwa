import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:raghwa/screens/all_popular_services.dart';
import 'package:raghwa/screens/all_services_screen.dart';
import 'package:raghwa/screens/coming_soon_screen.dart';
import 'package:raghwa/widgets/most_poplar_services_item.dart';
import 'package:raghwa/widgets/service_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final bottomBubblesWidget = SizedBox(
      height: height * 0.15,
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            SizedBox.expand(
              child: Container(
                color: Theme.of(context).primaryColor,
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                height: (constraints.maxHeight * 0.9),
                child: Image.asset(
                  'assets/images/bottom_bubbles_2.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        );
      }),
    );

    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            RotatedBox(
              quarterTurns: 2,
              child: bottomBubblesWidget,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width > 500 ? (height * 0.05) : 20,
                vertical: 26,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'مرحباً بك',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: (height * 0.04),
                            ),
                      ),
                      SizedBox(height: height * 0.015),
                      Text(
                        'في تطبيق رغوة',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: (height * 0.02),
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'الخدمات',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: (height * 0.025),
                            ),
                      ),
                      PlatformTextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const AllServicesScreen()),
                          );
                        },
                        child: Text(
                          'مشاهدة الكل',
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: (height * 0.02),
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 12,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(
                      6,
                      (index) {
                        return const ServiceItem(
                          imageURL: 'assets/images/clothes_washing.png',
                          name: 'غسيل ملابس',
                        );
                      },
                    ),
                  ),
                  const Divider(
                    thickness: 1.8,
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'أكثر الخدمات تداولاً',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: (height * 0.023),
                            ),
                      ),
                      PlatformTextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const AllPopularServices()),
                          );
                        },
                        child: Text(
                          'مشاهدة الكل',
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: (height * 0.02),
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  ListView.separated(
                    itemCount: 2,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, _) => SizedBox(
                      height: (height * 0.02).clamp(15, 25),
                    ),
                    itemBuilder: (context, _) {
                      return MostPoplarServicesItem(
                        height: height * 0.17,
                        image: 'assets/images/clothes_washing.png',
                        title: 'غسيل ملابس',
                        subtitle: 'Lorem ipsum dolor sit amet  Lorem ipsum dolor sit amet consectetur suspendisse.consectetur',
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.02),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        height: height * 0.12,
                        width: double.infinity,
                        child: PlatformTextButton(
                          alignment: const Alignment(0.75, -0.1),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const ComingSoonScreen()),
                            );
                          },
                          material: (_, __) => MaterialTextButtonData(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.zero,
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          cupertino: (_, __) => CupertinoTextButtonData(
                            color: Theme.of(context).primaryColor,
                            pressedOpacity: 0.7,
                            padding: EdgeInsets.zero,
                          ),
                          child: LayoutBuilder(builder: (context, constraints) {
                            return Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                SizedBox(
                                  width: constraints.maxHeight * 2.85,
                                  child: Transform.translate(
                                    offset: const Offset(-44, 0),
                                    child: Image.asset(
                                      'assets/images/bubbles.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(0.8, -0.01),
                                  child: Text(
                                    'تسوق مع رغوة',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: constraints.maxHeight * 0.22,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomBubblesWidget,
          ],
        ),
      ),
    );
  }
}
