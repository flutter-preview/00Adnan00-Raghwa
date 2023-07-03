import 'package:cloud_firestore/cloud_firestore.dart';
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
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('services').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator.adaptive());
              }

              return Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 12,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(
                      snapshot.data!.docs.length,
                      (index) {
                        return ServiceItem(
                          document: snapshot.data!.docs[index],
                        );
                      },
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
