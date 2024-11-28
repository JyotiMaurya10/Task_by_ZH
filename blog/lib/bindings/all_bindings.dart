import 'package:blog/controllers/blog_controller.dart';
import 'package:get/get.dart';

class AllBindings {
  Future<void> allBindingInitialize() async {
    Get.lazyPut<BlogController>(() => BlogController(), fenix: true);
  }
}
