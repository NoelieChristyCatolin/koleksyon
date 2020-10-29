import 'package:flutter/material.dart';

class AddCollection extends StatefulWidget {
  @override
  _AddCollectionState createState() => _AddCollectionState();
}

class _AddCollectionState extends State<AddCollection> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        FlatButton(
          onPressed: (){
            if(_formKey.currentState.validate()){
              _formKey.currentState.save();
              Navigator.pop(context);
            }
          }, child: Text("Add"),
        ),
      ],
      content: Form(
        key: _formKey,
        child: TextFormField(
          decoration: InputDecoration(labelText: 'Event Name'),
          validator: _isNotNull,
          onSaved: (value){
            //TODO: add save action
          },
        ),
      ),
    );
  }

  String _isNotNull(String value) {
    print("value.length ${value.length} ");
    if (value.length == 0) {
      print("zero");
      return 'Field Required';
    }
    print("value");
    return null;
  }
}
