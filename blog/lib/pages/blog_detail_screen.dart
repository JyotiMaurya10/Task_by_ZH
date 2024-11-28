import 'package:blog/controllers/blog_controller.dart';
import 'package:blog/widgets/blog_detail_appbar.dart';
import 'package:blog/models/blog_post_model.dart';
import 'package:blog/widgets/share_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:blog/utils/colors.dart';
import 'package:blog/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlogDetailScreen extends StatefulWidget {
  final BlogPost blog;
  const BlogDetailScreen({super.key, required this.blog});

  @override
  State<BlogDetailScreen> createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen> {
  late final BlogController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<BlogController>();
    controller.titlePadding = 1.0.obs;
    controller.avatarOpacity = 0.0.obs;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: CustomScrollView(
          controller: controller.mainscrollController,
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              collapsedHeight: 60,
              pinned: true,
              backgroundColor: primaryColor,
              elevation: 0,
              flexibleSpace: Obx(
                () => AppBarWidget(avatarOpacity: controller.avatarOpacity.value, blog: widget.blog),
              ),
              leading: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 8),
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.black26,
                  child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: highlightColor,
                      )),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.blog.content.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Text(
                              widget.blog.content[index],
                              style: heading16RegularTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 17),
                              textAlign: TextAlign.justify,
                            ),
                          );
                        }),
                    const ShareBar()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
