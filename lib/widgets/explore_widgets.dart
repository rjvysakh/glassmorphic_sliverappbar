import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sliverapp_header/utils/colors.dart';

class ExploreWidgets {
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

  sliverAppBar(Size? size,
      {IconData? leading,
      String? title,
      IconData? trailing,
      String? username,
      String? imgUrl,
      Function()? leadingOnPress,
      Function()? trailingOnPress,
      TextEditingController? controller}) {
    return SliverLayoutBuilder(builder: (BuildContext context, constraints) {
      return SliverAppBar(
        snap: false,
        pinned: true,
        floating: false,
        stretch: true,
        backgroundColor: backGroundColor,
        expandedHeight: size!.height * 0.23,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          titlePadding: const EdgeInsetsDirectional.only(start: 0),
          centerTitle: true,
          title: IgnorePointer(
            ignoring: constraints.scrollOffset == 0,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: constraints.scrollOffset > 40 ? 40 : 0,
                sigmaY: constraints.scrollOffset > 40 ? 40 : 0,
              ),
              child: AppBar(
                backgroundColor: backGroundColor.withOpacity(0),
                title: Text(
                  title!,
                  textScaleFactor: 1.0,
                  style: TextStyle(color: primaryColor, fontSize: 18),
                ),
                centerTitle: true,
                leading: IconButton(
                    onPressed: leadingOnPress,
                    icon: Icon(
                      leading,
                      color: primaryColor,
                    )),
                elevation: 0.0,
                actions: [
                  IconButton(
                      onPressed: trailingOnPress,
                      icon: Icon(
                        trailing,
                        color: primaryColor,
                      ))
                ],
              ),
            ),
          ),
          background: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text.rich(TextSpan(
                        text: "Explore\n",
                        style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w900,
                            fontSize: 29),
                        children: [
                          TextSpan(
                            text: greeting() + "! ",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 19),
                          ),
                          TextSpan(
                            text: "${username!.split(" ")[0]}",
                            style: TextStyle(
                                color: primaryColor.withOpacity(0.8),
                                fontWeight: FontWeight.w900,
                                fontSize: 19),
                          )
                        ],
                      )),
                      const Spacer(),
                      SizedBox(
                        width: 35,
                        height: 35,
                        child: CircleAvatar(
                          child: ClipOval(
                            child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                height: 35,
                                width: 35,
                                imageUrl: imgUrl!,
                                progressIndicatorBuilder: (context, url,
                                        downloadProgress) =>
                                    CircularProgressIndicator(
                                        valueColor:
                                            const AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                        value: downloadProgress.progress),
                                errorWidget: (context, url, error) => Container(
                                      color: Colors.white,
                                      child: Center(
                                        child: Text(
                                          username[0].toUpperCase(),
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18),
                                        ),
                                      ),
                                    )),
                          ),
                          backgroundColor: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () {},
                    child: IgnorePointer(
                      child: TextFormField(
                        controller: controller,
                        cursorColor: primaryColor,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.08),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        disabledgreyBottomnav.withOpacity(0.8),
                                    width: 0.1),
                                borderRadius: BorderRadius.circular(10)),
                            prefixIcon: const Icon(IconlyLight.search,
                                color: Color(0xFF0A1F59)),
                            suffixIcon: const Icon(IconlyLight.filter,
                                color: Color(0xFF0A1F59)),
                            contentPadding: const EdgeInsets.all(10),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Color(0xFF0A1F59),
                              ),
                            ),
                            hintText: "Search for keywords ",
                            hintStyle: TextStyle(color: primaryColor)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
