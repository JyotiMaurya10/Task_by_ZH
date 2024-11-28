import 'package:blog/bindings/bindings.dart';
import 'package:blog/controllers/blog_controller.dart';
import 'package:blog/pages/blog_detail_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:blog/pages/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter router = GoRouter(
    initialLocation: '/blog',
    routes: [
      GoRoute(
        path: '/blog',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/blog/:postId',
        builder: (context, state) {
          final BlogController blogController = Get.find();
          final postId = state.pathParameters['postId'];
          final blog = blogController.blogs.firstWhere(
            (blog) => blog.deeplink == postId,
            orElse: () => throw Exception('Blog not found'),
          );
          return BlogDetailScreen(blog: blog);
        },
      ),
    ],
    restorationScopeId: 'root',
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Blog',
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialBinding: InitialBinding(),
    );
  }
}
