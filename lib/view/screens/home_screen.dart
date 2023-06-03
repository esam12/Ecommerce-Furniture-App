import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:furniture/utils/constants.dart';
import 'package:furniture/view/widgets/product_widget.dart';

import 'category_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: Material(
        color: const Color(0xFFF3F6FD),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.05,
              left: size.width * 0.025,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Our Products",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: InkWell(
                        // when press on search button
                        onTap: () {},
                        child: Neumorphic(
                          style: NeumorphicStyle(
                              shape: NeumorphicShape.flat,
                              boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(12),
                              ),
                              color: const Color(0xFFF3F6FD),
                              intensity: 1),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.black54,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black26,
                  isScrollable: true,
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  tabs: [
                    Tab(text: 'Chairs'),
                    Tab(text: 'Sofas'),
                    Tab(text: 'Beds'),
                    Tab(text: 'Tables'),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SizedBox(
                  height: size.height * 0.5,
                  child: const TabBarView(
                    children: [
                      ProductWidget(),
                      Center(child: Text('Tab 1')),
                      Center(child: Text('Tab 1')),
                      Center(child: Text('Tab 1')),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                SizedBox(
                  height: size.height * 0.083,
                  child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  CategoryScreen(data:categories[index]),
                            ),
                          );
                        },
                        child: Neumorphic(
                          margin: const EdgeInsets.all(10),
                          padding: EdgeInsets.symmetric(
                              horizontal: size.height * 0.018,
                              vertical: size.width * 0.02),
                          style: NeumorphicStyle(
                            shape: NeumorphicShape.flat,
                            boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(20),
                            ),
                            color: const Color(0xFFF3F6FD),
                            intensity: 1,
                          ),
                          child: Center(
                            child: Text(
                              "${categories[index]}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                const Text(
                  "Best Offers",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
                ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        minLeadingWidth: size.height * 0.085,
                        leading: Image.asset(
                            'assets/images/Product ${index + 1}.png'),
                        title: const Text(
                          "Product Name",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                        subtitle: const Text(
                          'category',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black38,
                          ),
                        ),
                        trailing: const Text(
                          '\$223',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
