import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:furniture/view/widgets/catproductcard_widget.dart';

import '../../utils/constants.dart';

class CategoryScreen extends StatelessWidget {
  final String data;
  const CategoryScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Material(
      color: primaryColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: size.height * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                    Text(
                      data,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black38,
                      ),
                    ),
                    Neumorphic(
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12),
                          ),
                          color: primaryColor,
                          intensity: 1),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          CupertinoIcons.cart_fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Neumorphic(
                    style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(12),
                      ),
                      shape: NeumorphicShape.flat,
                      color: primaryColor,
                      intensity: 1,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.height * 0.03,
                        vertical: size.height * 0.01,
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.sort),
                          SizedBox(width: size.width * 0.01),
                          const Text('Sort',
                              style: TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.2,
                  ),
                  Neumorphic(
                    style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(12),
                      ),
                      shape: NeumorphicShape.flat,
                      color: primaryColor,
                      intensity: 1,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.height * 0.03,
                        vertical: size.height * 0.01,
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.filter_list),
                          SizedBox(width: size.width * 0.01),
                          const Text(
                            'Filter',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (size.width - 15 - 10) / (2 * 250),
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 5,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  if (index % 2 == 0) {
                    return CatProductCard(index: index);
                  }
                  return OverflowBox(
                    maxHeight: 250 + 70,
                    child: Container(
                      margin: EdgeInsets.only(top: size.height * 0.08),
                      child: CatProductCard(index: index),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
