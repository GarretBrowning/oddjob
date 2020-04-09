import 'package:flutter/material.dart';

class CreatePost extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreatePostState();
  }
}
// ToDo: Create Every Data Parameter For Creating A Post:
// Post Title
// Post Type (Ad/OddJob)
// Description
// Add Post Filter-Tags
// Contract Start Time & Contract End Time
// Set Price & Price Type
// Create and Cancel Buttons
// ** Ability To Add GPS Location & Images Coming Soon **

class CreatePostState extends State<CreatePost> {

  //This will allow the user to either create an Ad, or An OddJob
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
                items: _priorities.map((String dropDownStringItem) {
                  return DropdownMenuItem<String> (
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),

                  style: textStyle,

                  value: 'Ad',

                  onChanged: (valueSelectedByUser) {
                    setState(() {});  // possibly do something with this
                  }
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
                  labelText: 'Title',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ),
            ),

            // THIRD ELEMENT - Description text field
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: titleController,
                style: textStyle,
                onChanged: (value) {
                  debugPrint('Something changed in Title Text Field');
                },
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),

            // FOURTH ELEMENT - Buttons
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton( // POST JOB BUTTON
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

                  Container(width: 5.0,), // ADDS SEPARATION BETWEEN BUTTONS

                  Expanded(
                    child: RaisedButton( // DELETE BUTTON
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Cancel',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        // Implement later
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