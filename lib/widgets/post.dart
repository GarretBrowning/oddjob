import 'package:flutter/material.dart';

class Post extends StatefulWidget{
  Post({@required this.title, this.description, @required this.price, @required this.postType, @required this.priceType});
  final String title;
  final String description;
  final String price;
  final bool postType;
  final bool priceType;

  @override
  _PostState createState() => _PostState(
    priceType: priceType == true ? ' (per hour)' : ' (flat rate)',
  );
}

class _PostState extends State<Post> {
_PostState({@required this.priceType});
  final String priceType;

  /// Can possibly delete this:
  IconButton _favouriteButton =  IconButton(
    icon: Icon(Icons.favorite_border),
    color: Colors.grey,
    onPressed: (){},
  );

  Icon _affectedByStateChange =  Icon(
    Icons.favorite,
    color: Colors.red,
  );

  /// Can possibly delete this too:
  _changeFavouriteButtonColour() {
    _favouriteButton =  IconButton(
      icon: _affectedByStateChange,
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.caption;
    return Card(
        margin: const EdgeInsets.all(30.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
        elevation: 15.0,
        child: Container(
            height: 140,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: widget.postType == true ? Icon(Icons.announcement) : Icon(Icons.assignment_ind),
                    title: widget.title == null ? Text('TITLE-PROPERTY-IS-BLANK') : Text(widget.title),
                    subtitle: Text('[Sample] [Ad] [Housework] [Painting]'),
                  ),
                  ButtonBar(
                    // orientate & figure out alignment later --
                    children: <Widget>[
                      Text(widget.price == null ? 'PRICE-PROPERTY-IS-BLANK' : r'$' + widget.price + priceType, style: textStyle),
                      IconButton(
                        icon: _favouriteButton,
                        onPressed: () {
                          setState(() {
                            _changeFavouriteButtonColour();
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
        )
    );
  }
}
