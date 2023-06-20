import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:raghwa/widgets/service_item.dart';

class AllServicesScreen extends StatelessWidget {
  const AllServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PlatformScaffold(
        backgroundColor: Colors.white,
        appBar: PlatformAppBar(
          backgroundColor: Colors.white,
          cupertino: (_, __) => CupertinoNavigationBarData(),
          material: (_, __) => MaterialAppBarData(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Theme.of(context).primaryColor,
              size: 26,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            crossAxisSpacing: 0,
            mainAxisSpacing: 12,
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
        ),
      ),
    );
  }
}
