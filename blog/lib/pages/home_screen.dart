import 'package:blog/controllers/blog_controller.dart';
import 'package:blog/widgets/blog_card_shimmer.dart';
import 'package:blog/widgets/home_appbar.dart';
import 'package:blog/widgets/blog_card.dart';
import 'package:blog/utils/colors.dart';
import 'package:blog/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BlogController blogController = Get.find();

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            HomeAppBar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Obx(() {
                  if (blogController.loading.value) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return const BlogCardShimmer();
                      },
                    );
                  }
                  if (blogController.filteredBlogs.isEmpty) {
                    return const Center(
                        child: Text(
                      "Oops! No related blogs found",
                      style: heading16MediumTextStyle,
                    ));
                  }
                  return NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      blogController.homeFocusNode.value.unfocus();
                      return false;
                    },
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: blogController.filteredBlogs.length,
                      itemBuilder: (context, index) {
                        final blog = blogController.filteredBlogs[index];
                        return BlogCard(blog: blog);
                      },
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
