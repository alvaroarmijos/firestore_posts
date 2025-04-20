import 'package:firestore_posts/posts/cubit/posts_cubit.dart';
import 'package:firestore_posts/posts/view/view.dart';
import 'package:firestore_posts/posts/widget/posts_error_state.dart';
import 'package:firestore_posts/posts/widget/posts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/test_data.dart';

class MockPostsCubit extends Mock implements PostsCubit {}

void main() {
  late Widget widget;
  late PostsCubit postsCubit;

  setUp(() {
    postsCubit = MockPostsCubit();

    widget = MaterialApp(
      home: BlocProvider<PostsCubit>.value(
        value: postsCubit,
        child: const PostsPage(),
      ),
    );
  });

  void mockPostsCubit(PostsState state) {
    when(() => postsCubit.state).thenReturn(state);
    when(() => postsCubit.stream).thenAnswer((_) => Stream.value(state));
  }

  testWidgets('PostsLoadingState', (WidgetTester tester) async {
    mockPostsCubit(const PostsLoadingState());
    await tester.pumpWidget(widget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('PostsUserErrorState', (WidgetTester tester) async {
    mockPostsCubit(const PostsUserErrorState('Error'));
    await tester.pumpWidget(widget);
    expect(find.byType(PostsErrorState), findsOneWidget);
    expect(find.text('Error'), findsOneWidget);
  });

  testWidgets('PostsLoadedState', (WidgetTester tester) async {
    mockPostsCubit(PostsLoadedState(posts: TestData.posts1));
    await tester.pumpWidget(widget);
    expect(find.byType(PostsList), findsOneWidget);
  });
}
