import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:oddjob/createPostPage/create_post.dart';
import 'package:oddjob/widgets/post.dart';
import 'package:provider/provider.dart';

class PostListModel extends ChangeNotifier {

  /// Sample Post in case the list is Null;
  final Post samplePost = Post(title: 'No Real Post Made Yet', price: 'Create A Post!', description: '', postType: true, priceType: false);

  /// Internal, private state of the post list.
  final List<Post> _postList = [];

  /// An unmodifiable view of the items in the post list.
  UnmodifiableListView<Post> get postList => UnmodifiableListView(_postList);

  List get postListGetter => _postList;

  /// Adds [post] to cart. This is the only ways to modify the post list from the outside.
  void add(Post post) {
    _postList.add(post);
    print('added post to _postList'); ///FOR ERROR CHECKING
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}