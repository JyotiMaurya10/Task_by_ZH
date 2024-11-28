import 'package:blog/controllers/blog_controller.dart';
import 'package:blog/utils/colors.dart';
import 'package:blog/utils/strings.dart';
import 'package:blog/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({super.key});

  final BlogController blogController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, right: 16, left: 16, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              width: 50,
              height: 48,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: highlightColor,
                      ),
                      child: Expanded(
                        child: TextField(
                          focusNode: blogController.homeFocusNode.value,
                          controller: blogController.homeSearchController,
                          onChanged: (value) => blogController.searchBlogs(value),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: homeHintText,
                              hintStyle: heading14RegularTextStyle.copyWith(
                                color: const Color(0xFF6F6F6F),
                              )),
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    height: 48,
                    duration: const Duration(milliseconds: 400),
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                          onTap: () => {},
                          child: Row(
                            children: [
                              const SizedBox(width: 12),
                              GestureDetector(
                                onTap: () {},
                                child: CircleAvatar(
                                  backgroundColor: highlightColor,
                                  radius: 20,
                                  child: Image.asset(search, color: primaryColor),
                                ),
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
