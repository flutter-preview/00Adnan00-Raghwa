import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:raghwa/widgets/most_poplar_services_item.dart';
import 'package:raghwa/widgets/service_item.dart';

class AllPopularServices extends StatelessWidget {
  const AllPopularServices({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

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
                child: ListView.separated(
                  itemCount: snapshot.data!.docs.length,
                  padding: const EdgeInsets.symmetric(horizontal: 19).copyWith(top: 20),
                  itemBuilder: (context, index) => MostPoplarServicesItem(
                    height: height * 0.17,
                    document: snapshot.data!.docs[index],
                  ),
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                ),
              );
            }),
      ),
    );
  }
}
