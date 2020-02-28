
class Post {

  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  Post(this._title, this._date, this._priority, [this._description]);
  Post.withId(this._id, this._title, this._date, this._priority, [this._description]);

  int get id => _id;
  String get title => _title;
  String get description => _description;
  int get priority => _priority;
  String get date => _date;

  set title(String newTitle) {    // Look into additional text field conditions
    if (newTitle.length <= 255) { // Condition if less than 255 characters save to database
      this._title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) { // Condition if less than 255 characters save to database
      this._description = newDescription;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      this._priority = newPriority;
    }
  }

  set date(String newDate) {
      this._date = newDate;
  }

  // Convert a Post object into a MAP object
  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();

    if(id != null) {
      map['id'] = _id;
    }

    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;
    map['date'] = _date;

    return map;
  }

  // Extract a Post object from a Map object
  Post.fromMapObject(Map<String, dynamic> map) {

    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._priority = map['priority'];
    this._date = map['date'];
  }
}












