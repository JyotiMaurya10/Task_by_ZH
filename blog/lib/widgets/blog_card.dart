import 'package:blog/widgets/read_more_button.dart';
import 'package:blog/models/blog_post_model.dart';
import 'package:go_router/go_router.dart';
import 'package:blog/utils/strings.dart';
import 'package:blog/utils/styles.dart';
import 'package:blog/utils/colors.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({
    super.key,
    required this.blog,
  });

  final BlogPost blog;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          decoration: BoxDecoration(
            color: highlightColor,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      placeholder: whiteBg,
                      image: blog.imageURL,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(blog.title, style: heading16SemiBoldTextStyle),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(blog.summary,
                      style: heading14RegularTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                      )),
                ),
                GestureDetector(
                    onTap: () => context.push('/blog/${blog.deeplink}'),
                    child: const Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: ReadMoreButton(),
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
