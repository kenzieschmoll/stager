class Post {
  final int id;
  final String text;
  final String author;
  final DateTime time;

  Post({
    required this.id,
    required this.text,
    required this.author,
    required this.time,
  });

  static List<Post> fakePosts = List.generate(
    20,
    (index) => Post(
      id: index + 1,
      text: 'Post ${index + 1}',
      author: 'Poster ${index + 1}',
      time: DateTime.now(),
    ),
  );
}