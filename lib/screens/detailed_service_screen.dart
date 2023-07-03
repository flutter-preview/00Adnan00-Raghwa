import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class DetailedServiceScreen extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> document;

  const DetailedServiceScreen({super.key, required this.document});

  Widget _buildTile(
    BuildContext context, {
    required String title,
    required Widget leading,
    required String trailingText,
  }) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      child: LayoutBuilder(builder: (context, constraints) {
        final textStyle = TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w600,
          fontSize: (constraints.maxHeight * 0.32).clamp(20, 26),
        );
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              SizedBox.square(
                dimension: constraints.maxHeight * 0.5,
                child: leading,
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: textStyle,
              ),
              const Spacer(),
              Text(
                trailingText,
                style: textStyle,
              ),
            ],
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Directionality(
          textDirection: TextDirection.ltr,
          child: PlatformAppBar(
            backgroundColor: Colors.transparent,
            cupertino: (_, __) => CupertinoNavigationBarData(),
            material: (_, __) => MaterialAppBarData(
              elevation: 0,
              iconTheme: const IconThemeData(
                color: Colors.white,
                size: 26,
              ),
            ),
          ),
        ),
      ),
      body: StreamBuilder(
          stream: document.reference.snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }

            Map<String, dynamic>? serviceData = snapshot.data!.data();

            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.45,
                    width: double.infinity,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Stack(
                        alignment: Alignment.center,
                        fit: StackFit.expand,
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Image.network(
                              serviceData!['background_image_url'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0, 0.2),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  serviceData!['name'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: constraints.maxHeight * 0.084,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Image.network(
                                  serviceData!['image_url'],
                                  height: constraints.maxHeight * 0.35,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width > 500 ? (height * 0.05) : 20,
                    ).copyWith(
                      top: (height * 0.04).clamp(20, 1000),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'وصف الخدمة',
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: (height * 0.025).clamp(18, 28),
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          serviceData!['description'],
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: (height * 0.0198).clamp(16, 25),
                              ),
                        ),
                        const SizedBox(height: 20),
                        Divider(
                          thickness: 1.5,
                          color: Theme.of(context).primaryColor.withOpacity(0.2),
                        ),
                        _buildTile(
                          context,
                          title: 'سعر الخدمة',
                          leading: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Image.asset('assets/images/money_icon.png'),
                          ),
                          trailingText: '100 د.ل',
                        ),
                        Divider(
                          thickness: 1.5,
                          color: Theme.of(context).primaryColor.withOpacity(0.2),
                        ),
                        _buildTile(
                          context,
                          title: 'مدة التوصيل',
                          leading: Image.asset('assets/images/delivery_duration.png'),
                          trailingText: 'خلال 24 ساعة',
                        ),
                        Divider(
                          thickness: 1.5,
                          color: Theme.of(context).primaryColor.withOpacity(0.2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
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
          }),
    );
  }
}
