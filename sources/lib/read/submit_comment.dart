//chua_lien_ket_de_dieu_huong

import 'package:flutter/material.dart';

class Comment extends StatefulWidget{
  const Comment ({Key? key}): super(key: key);
  @override
  WriteComment createState() => WriteComment();
}
class WriteComment extends State<StatefulWidget>{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Enter your comment",
            ),

          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: (){
                if(formKey.currentState!.validate()){
                  //Process data.
                }
              },
              child: const Text('Submit'),
            ),
          )
        ],
      ),
    );
  }
}