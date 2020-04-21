import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

class DateTimePicker extends StatefulWidget {
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker>{
//  DateTime _selectedDate;

//  TimeOfDay _startTime;
  DateTime _startDate;

//  TimeOfDay _endTime;
  DateTime _endDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: Column(
        children: <Widget>[

          // Start Time & Date Row:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(_startDate == null ? 'Select Start Time/Date:' : _startDate.toString()),
              Row(
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 100.0,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text('Start Time'),
                      onPressed: () {
                        showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                      },
                    ),),
                  Container(width: 10.0),
                  ButtonTheme(
                    minWidth: 100.0,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text('Start Date'),
                      onPressed: () {
                        showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            initialDate: _startDate == null ? DateTime.now() : _startDate,
                            lastDate: DateTime(2021)
                        ).then((date) {
                          setState(() {
                            _startDate = date;
                          });
                        });
                      },
                    ),
                  ),
                ],),
            ],
          ),

          // End Time & Date Row:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(_endDate == null ? 'Select End Time/Date:' : _endDate.toString()),
              Row(
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 100.0,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text('End Time'),
                      onPressed: () {
                        showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                      },
                    ),
                  ),
                  Container(width: 10.0),
                  ButtonTheme(
                    minWidth: 100.0,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text('End Date'),
                      onPressed: () {
                        showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            initialDate: _endDate == null ? DateTime.now() : _endDate,
                            lastDate: DateTime(2021)
                        ).then((date) {
                          setState(() {
                            _endDate = date;
                          });
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}