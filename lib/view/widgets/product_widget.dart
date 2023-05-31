import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          width: size.width,
          height: size.height * 0.2,
          color: Colors.amber,
          child: Neumorphic(style: NeumorphicStyle()),
        );
      },
    );
  }
}
