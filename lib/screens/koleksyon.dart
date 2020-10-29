import 'package:flutter/material.dart';
import 'package:koleksyon/screens/search_view.dart';
import 'package:koleksyon/screens/collection_view.dart';
import 'package:koleksyon/components/collection_list.dart';


class Koleksyon extends StatefulWidget {
  String title;

  Koleksyon(this.title);

  @override
  _KoleksyonState createState() => _KoleksyonState();
}

class _KoleksyonState extends State<Koleksyon> {

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    SearchView(),
    CollectionView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(widget.title),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Collections")
        ],
        selectedItemColor: Colors.red,
        currentIndex: _selectedIndex,
        onTap: (value){
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }

}
