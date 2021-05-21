import 'package:flutter/material.dart';

class CreatePost extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreatePostState();
  }
}

// ToDo: Create Every Data Parameter For Creating A Post:
// Add Post Filter-Tags
// Contract Start Time & Contract End Time
// Set Price & Price Type
// ** Ability To Add GPS Location & Images Coming Soon **

class CreatePostState extends State<CreatePost> {
  //This will allow the user to either create an Ad, or An OddJob
  String valueChoose;
  static var _priorities = ['Ad', 'OddJob'];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;

    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Post'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            // FIRST ELEMENT - Priorities dropdown menu
            ListTile(
              title: DropdownButton(
                style: textStyle,
                hint: Text("Select Job Type"),
                value: valueChoose,
                onChanged: (newValue) {
                  setState(() {
                    valueChoose = newValue;
                  }); // possibly do something with this
                },
                items: _priorities.map((dropDownItem) {
                  return DropdownMenuItem(
                    value: dropDownItem,
                    child: Text(dropDownItem),
                  );
                }).toList(),
              ),
            ),

            // SECOND ELEMENT - Title text field
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: titleController,
                style: textStyle,
                onChanged: (value) {
                  debugPrint('Something changed in Title Text Field');
                },
                decoration: InputDecoration(
                    labelText: 'Enter Title',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),

            // THIRD ELEMENT - Description text field
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: descriptionController,
                style: textStyle,
                onChanged: (value) {
                  debugPrint('Something changed in Title Text Field');
                },
                decoration: InputDecoration(
                    labelText: 'Enter Description',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),

            // FOURTH ELEMENT - Buttons
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      // POST JOB BUTTON
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Create',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        // Implement later
                      },
                    ),
                  ),

                  Container(
                    width: 5.0,
                  ), // ADDS SEPARATION BETWEEN BUTTONS

                  Expanded(
                    child: RaisedButton(
                      // DELETE BUTTON
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Cancel',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home_page');
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
