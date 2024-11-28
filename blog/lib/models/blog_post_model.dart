class BlogPost {
  final String imageURL;
  final String title;
  final String summary;
  final List<String> content;
  final String deeplink;

  BlogPost({
    required this.imageURL,
    required this.title,
    required this.summary,
    required this.content,
    required this.deeplink,
  });

  factory BlogPost.fromDocumentSnapshot(Map<String, dynamic> data) {
    return BlogPost(
      imageURL: data['imageURL'] ?? '',
      title: data['title'] ?? '',
      summary: data['summary'] ?? '',
      content: extractContent(data['content']),
      deeplink: data['deeplink'] ?? '',
    );
  }

  static List<String> extractContent(dynamic contentData) {
    if (contentData is List) {
      return List<String>.from(contentData.map((e) => e.toString()));
    } else {
      return [];
    }
  }
}
