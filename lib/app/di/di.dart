import 'package:get_it/get_it.dart' show GetIt;
import 'package:posts_repository/posts_repository.dart';

/// Global [GetIt] instance
final getIt = GetIt.instance;

/// The global dependencies registration method
void registerGlobalDeps() {
  getIt.registerLazySingleton<PostsRepository>(PostsRepository.new);
}
