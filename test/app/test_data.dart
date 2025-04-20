import 'package:posts_repository/posts_repository.dart';

class TestData {
  static final post = Post(
    id: 'id',
    author: 'Author',
    content: 'Lorem ipsum dolor sit amet.',
    likes: 1,
    dislikes: 0,
    timestamp: 1,
  );
  static final posts1 = [
    Post(
      id: 'id1',
      author: 'Alvaro',
      content: 'Lorem ipsum dolor sit amet.',
      likes: 1,
      dislikes: 0,
      timestamp: 1,
    ),
    Post(
      id: 'id2',
      author: 'Test',
      content: 'Lorem ipsum dolor sit amet.',
      likes: 5,
      dislikes: 2,
      timestamp: 2,
    ),
  ];

  static final posts2 = [
    Post(
      id: 'id3',
      author: 'Author',
      content: 'Lorem ipsum dolor sit amet.',
      likes: 12,
      dislikes: 0,
      timestamp: 3,
    ),
    Post(
      id: 'id4',
      author: 'Test',
      content: 'Lorem ipsum dolor sit amet.',
      likes: 52,
      dislikes: 12,
      timestamp: 4,
    ),
  ];
}
