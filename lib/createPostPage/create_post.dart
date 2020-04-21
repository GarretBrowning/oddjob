import 'package:flutter/material.dart';
import 'package:oddjob/models/posts_list._model.dart';
import 'package:oddjob/widgets/post.dart';
import 'package:provider/provider.dart';

final samplePostForTesting = Post(
  title: 'This is the post title',
  description: 'This is the description of the post',
  price: '369',
  postType: true,
  priceType: false,
);

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  // Constructor variables to set later to pass to Post.dart
  String title;
  String description;
  String price;
  bool postType;
  bool priceType;

  // This will allow the user to either create an Ad, or An OddJob:
  String postOptionsDropdownValue = 'Work For Hire';
  static var _postOptions = ['Work For Hire', 'Personal OddJob'];

  //This will allow the user to either charge a Flat Fee, or Per Hour:
  String priceOptionsDropdownValue = 'Flat Fee';
  static var _priceOptions = ['Flat Fee', 'Per Hour'];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    Post createdPost;
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Post'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            /// Priorities dropdown menu:
            ListTile(
              title: DropdownButton(
                value: postOptionsDropdownValue,
                items: _postOptions.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String newValue) {
                  setState(() {
                    postOptionsDropdownValue = newValue;
                  });
                },
              ),
            ),
            /// Title text field:
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: titleController,
                style: textStyle,
                onChanged: (value) {
                  debugPrint('Something changed in Title Text Field');
                  title = value;
                },
                decoration: InputDecoration(
                  labelText: 'Title:',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ),
            ),
            /// Description text field:
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: descriptionController,
                style: textStyle,
                onChanged: (value) {
                  debugPrint('Something changed in Title Text Field');
                },
                decoration: InputDecoration(
                    labelText: 'Description:',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),
            /// Price text field and Price Type Selector dropdown menu:
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  /// Price text field:
                  Expanded(
                    child: TextField(
                      controller: priceController,
                      style: textStyle,
                      onChanged: (value) {
                        debugPrint('Something changed in Title Text Field');
                        price = value;
                      },
                      decoration: InputDecoration(
                          labelText: r'Price ($):',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                    ),
                  ),
                  /// Price Type Selector dropdown menu:
                  Expanded(
                    child: ListTile(
                      title: DropdownButton(
                        value: priceOptionsDropdownValue,
                        items: _priceOptions.map<DropdownMenuItem<String>>((
                            String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            priceOptionsDropdownValue = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /// Create & Cancel Buttons:
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  /// Create Post button:
                  Consumer<PostListModel>(
                    builder: (context, model, widget) => Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text('Create', textScaleFactor: 1.5),
                      onPressed: () async {
                        await createPost(title, '', price, true, false, model);
                        Navigator.pushNamed(context, '/home_page');
                      },
                    ),
                  )
                  ),
                  Container(width: 5.0), // ADDS SEPARATION BETWEEN BUTTONS
                  /// Cancel button:
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text('Cancel', textScaleFactor: 1.5),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


Future createPost(String title, String description, String price, bool postType, bool priceType, model) {
  final post =  Post(title: title,  price: price, description: description, postType: postType, priceType: priceType);
  return model.add(post);
}