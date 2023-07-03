import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:raghwa/screens/detailed_service_screen.dart';

class ServiceItem extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> document;

  const ServiceItem({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return PlatformTextButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailedServiceScreen(
            document: document,
          ),
        ));
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final imageBoxDimension = constraints.maxHeight * 0.7;
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: imageBoxDimension,
                width: imageBoxDimension,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: FractionallySizedBox(
                  heightFactor: 0.65,
                  child: Image.network(
                    document['image_url'],
                    height: double.infinity,
                  ),
                ),
              ),
              Text(
                document['name'],
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: constraints.maxHeight * 0.125,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
