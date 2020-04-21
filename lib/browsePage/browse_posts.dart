import 'package:flutter/material.dart';
import 'package:oddjob/models/posts_list._model.dart';
import 'package:oddjob/widgets/create_posts_floating_action_button.dart';
import 'package:oddjob/widgets/post.dart';
import 'package:provider/provider.dart';

/// SAMPLE POSTS FOR TESTING:
final Post sample1 = Post(
    title: 'gay title',
    price: 'gay price ',
    description: 'fag',
    postType: true,
    priceType: false
);
final Post sample2 = Post(
    title: 'GGGGGG',
    price: 'HHHH ',
    description: 'fag',
    postType: false,
    priceType: true
);
/// ///////// //////// ///////
///
///
/// Going to try using Selector instead of Consumer

class BrowsePostsPage extends StatelessWidget {
  final Widget createPostFloatingActionButton = CreatePostFloatingActionButton();
  @override
  Widget build(BuildContext context) {
    return Selector<PostListModel, List>(
        builder: (context, postList, child) => Container(
          child: Scaffold(
            body: ListView(children: Provider.of<PostListModel>(context, listen: false).postListGetter),
            floatingActionButton: createPostFloatingActionButton
          )
        ),
      selector: (buildContext, model) => model.postListGetter,
    );
  }
}

//              body: Column(
//              children: <Widget>[
//                sample1,
//                postList.isEmpty ? Text('PostList is Null') : Provider.of<PostListModel>(context, listen: false).postList[0],
//                Text(postList.length.toString())
//              ]
//              ),