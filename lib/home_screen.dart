import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sliverapp_header/utils/colors.dart';

import 'widgets/explore_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  TextEditingController? textEditingController =
      TextEditingController(); //searh textfield
  ExploreWidgets widgets = ExploreWidgets();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: backGroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          ///app bar for explore
          widgets.sliverAppBar(size,
              leading: IconlyLight.search,
              trailing: IconlyLight.edit,
              username: "John Doe",
              imgUrl:
                  "https://images.unsplash.com/photo-1618641986557-1ecd230959aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aW5zdGFncmFtJTIwcHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80",
              title: "Explore",
              leadingOnPress: () {},
              trailingOnPress: () {},
              controller: textEditingController),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.all(15),
                  child: Container(
                    color: Colors.blue[100 * (index % 9 + 1)],
                    height: 80,
                    alignment: Alignment.center,
                    child: Text(
                      "Item $index",
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                );
              },
              childCount: 100, // 1000 list items
            ),
          )
        ],
      ),
    );
  }
}
