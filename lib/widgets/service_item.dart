import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:raghwa/screens/detailed_service_screen.dart';

class ServiceItem extends StatelessWidget {
  final String imageURL;
  final String name;

  const ServiceItem({
    super.key,
    required this.imageURL,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return PlatformTextButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailedServiceScreen(
            image: imageURL,
            name: name,
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
                  heightFactor: 0.6,
                  child: Image.asset(
                    imageURL,
                    height: double.infinity,
                  ),
                ),
              ),
              Text(
                name,
                maxLines: 2,
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
