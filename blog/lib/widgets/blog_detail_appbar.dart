import 'package:blog/models/blog_post_model.dart';
import 'package:blog/utils/colors.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.avatarOpacity, required this.blog});
  final double avatarOpacity;
  final BlogPost blog;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        centerTitle: false,
        collapseMode: CollapseMode.parallax,
        title: Stack(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              color: primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Visibility(visible: avatarOpacity == 1, child: const SizedBox(width: 50)),
                  Visibility(
                    visible: avatarOpacity == 1,
                    child: AnimatedOpacity(
                        opacity: avatarOpacity,
                        duration: const Duration(seconds: 1),
                        child: avatarOpacity == 1
                            ? Row(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundImage: NetworkImage(blog.imageURL),
                                  ),
                                  const SizedBox(width: 8)
                                ],
                              )
                            : const SizedBox.shrink()),
                  ),
                  SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          blog.title,
                          style: avatarOpacity == 1
                              ? const TextStyle(color: highlightColor, fontSize: 18, fontWeight: FontWeight.w500)
                              : const TextStyle(color: highlightColor, fontSize: 16, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: avatarOpacity != 1
                        ? BoxDecoration(border: Border.all(color: highlightColor), borderRadius: const BorderRadius.all(Radius.circular(5)))
                        : const BoxDecoration(),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        avatarOpacity != 1 ? Icons.share_outlined : Icons.more_vert,
                        color: highlightColor,
                        size: avatarOpacity != 1 ? 14 : 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        background: Image.network(
          blog.imageURL,
          fit: BoxFit.contain,
          alignment: Alignment.topCenter,
        ),
      );
    });
  }
}
