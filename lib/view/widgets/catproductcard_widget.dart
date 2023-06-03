import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:furniture/utils/constants.dart';

class CatProductCard extends StatelessWidget {
  final int index;
  const CatProductCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Neumorphic(
        style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.circular(12),
            ),
            color: primaryColor,
            intensity: 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/Product ${index + 1}.png',
                height: size.height * 0.28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
