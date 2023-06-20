import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Align(
      alignment: const Alignment(0, 0.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/no_internet_icon.png',
            height: height * 0.22,
          ),
          const SizedBox(height: 20),
          Text(
            'لايوجد اتصال بالانترنت',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: height * 0.03,
                  color: Colors.black,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'تحقق من الاتصال الخاص بك',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: height * 0.018,
                  color: Colors.grey,
                ),
          ),
          SizedBox(height: height * 0.2),
          SizedBox(
            width: height * 0.3,
            height: height * 0.07,
            child: LayoutBuilder(builder: (context, constraints) {
              return PlatformTextButton(
                onPressed: () {},
                material: (_, __) => MaterialTextButtonData(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),
                ),
                cupertino: (_, __) => CupertinoTextButtonData(
                  color: Theme.of(context).primaryColor,
                  pressedOpacity: 0.7,
                  borderRadius: BorderRadius.circular(1000),
                ),
                child: Align(
                  alignment: const Alignment(0.1, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.play_arrow_sharp,
                        color: Colors.white,
                        size: constraints.maxHeight * 0.6,
                      ),
                      Text(
                        'طلب الخدمة',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: constraints.maxHeight * 0.36,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
