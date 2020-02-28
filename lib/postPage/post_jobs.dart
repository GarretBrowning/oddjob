import 'package:flutter/material.dart';
import 'dart:async';
import 'package:oddjob/models/post.dart';
import 'package:oddjob/utils/database_helper.dart';
import 'package:intl/intl.dart';

class PostJobPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return PostJobPageState();
  }
}

class PostJobPageState extends State<PostJobPage> {

  static var _priorities = ['High', 'Low'];

  DatabaseHelper helper = DatabaseHelper();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.subtitle1;

    // later modify to empty the text boxes
    //titleController.text = ;
    //descriptionController.text = ;

    return Scaffold(
      appBar: AppBar(
        title: Text('Post a Job'),
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

                  value: 'Low',

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
                controller: descriptionController,
                style: textStyle,
                onChanged: (value) {
                  debugPrint('Something changed in description Text Field');
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
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Post Job',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        // Implement later
                      },
                    ),
                  ),

                  Container(width: 15.0,), // ADDS SEPARATION BETWEEN BUTTONS

                  Expanded(
                    child: RaisedButton( // DELETE BUTTON
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Delete',
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