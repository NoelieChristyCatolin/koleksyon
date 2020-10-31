import 'package:flutter/material.dart';
import 'package:koleksyon/models/splash_image_view_model.dart';
import 'package:koleksyon/models/splash_image_view_model.dart';
import 'package:provider/provider.dart';

class CreateCollection extends StatefulWidget {
  String collectionName;
  int index;

  CreateCollection([this.collectionName, this.index]);

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
              if(widget.index != null &&  widget.collectionName != null){
                Provider.of<SplashImageViewModel>(context, listen: false).editCollection(widget.collectionName, widget.index);
              }
              else{
                Provider.of<SplashImageViewModel>(context, listen: false).createNewCollection(widget.collectionName);
              }
              Navigator.pop(context);
            }
          }, child: Text("Add"),
        ),
      ],
      content: Form(
        key: _formKey,
        child: TextFormField(
          initialValue: widget.collectionName,
          decoration: InputDecoration(labelText: 'Event Name'),
          validator: _isNotNull,
          onSaved: (value){
            setState(() {
              widget.collectionName = value;
            });
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
