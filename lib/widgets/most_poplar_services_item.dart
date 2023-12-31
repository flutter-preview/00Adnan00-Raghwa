import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:raghwa/screens/detailed_service_screen.dart';

class MostPoplarServicesItem extends StatelessWidget {
  final double height;
  final double width;
  final QueryDocumentSnapshot<Map<String, dynamic>> document;

  const MostPoplarServicesItem({
    super.key,
    this.width = double.infinity,
    this.height = 120,
    required this.document,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: height,
        width: width,
        child: PlatformTextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailedServiceScreen(
                document: document,
              ),
            ));
          },
          material: (_, __) => MaterialTextButtonData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey,
              backgroundColor: Colors.grey[100],
            ),
          ),
          cupertino: (_, __) => CupertinoTextButtonData(
            color: Colors.grey[100],
            pressedOpacity: 0.7,
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            final leadingDimension = height * 0.7;
            return Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 10,
                  ),
                  width: leadingDimension,
                  height: leadingDimension,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: height * 0.6,
                      width: height * 0.6,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: FractionallySizedBox(
                        heightFactor: 0.6,
                        child: Image.network(
                          document['image_url'],
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        document['name'],
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              fontSize: constraints.maxHeight * 0.18,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        document['description'],
                        maxLines: 3,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: constraints.maxHeight * 0.11,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
