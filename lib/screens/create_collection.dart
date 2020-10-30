import 'package:flutter/material.dart';

class CreateCollection extends StatefulWidget {

  @override
  _CreateCollectionState createState() => _CreateCollectionState();
}

class _CreateCollectionState extends State<CreateCollection> {
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
    if (value.length == 0) {
      return 'Field Required';
    }
    return null;
  }
}
