import 'package:blog/models/blog_post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlogController extends GetxController {
  final blogs = <BlogPost>[].obs;
  final filteredBlogs = <BlogPost>[].obs;
  final homeFocusNode = FocusNode().obs;
  var titlePadding = 1.0.obs;
  var avatarOpacity = 0.0.obs;
  var folded = true.obs;
  var loading = false.obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final ScrollController mainscrollController = ScrollController();
  final TextEditingController homeSearchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchBlogPosts();
    mainscrollController.addListener(() {
      avatarOpacity.value = (mainscrollController.offset / 200).clamp(0.0, 1.0);
      titlePadding.value = (mainscrollController.offset / 200 * 40).clamp(16.0, 56.0);
    });
  }

  Future<void> fetchBlogPosts() async {
    try {
      loading.value = true;
      final snapshot = await firestore.collection('blogs').get();
      final data = snapshot.docs.map((doc) => BlogPost.fromDocumentSnapshot(doc.data())).toList();
      blogs.assignAll(data);
      filteredBlogs.assignAll(data);
    } catch (e) {
      debugPrint('Error fetching blogs: $e');
    }finally{
      loading.value = false;
    }
  }

  void searchBlogs(String query) {
    filteredBlogs.clear();
    if (query.isEmpty) {
      filteredBlogs.assignAll(blogs);
    } else {
      final List<String> queryWords = query.toLowerCase().split(' ').where((word) => word.isNotEmpty).toList();
      if (queryWords.isEmpty) {
        filteredBlogs.assignAll(blogs);
      } else {
        filteredBlogs.assignAll(
          (blogs).where((blog) {
            final String title = blog.title.toLowerCase();
            return queryWords.any((word) => title.contains(word));
          }).toList(),
        );
      }
    }
  }
}
