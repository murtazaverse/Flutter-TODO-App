import 'package:flutter/material.dart';



class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
List<dynamic> lst = [1,2,3];
var output = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Center(child: Text("TODO APP")),),
      body:
    ListView.builder(
      itemCount: lst.length,
      itemBuilder: (context,index){
        return Container(
          height: 50,
          margin: EdgeInsets.only(top:10),
          child: ListTile(
            title: Text("${lst[index]}"),
            tileColor: Colors.red,
            trailing: Container(
              width: 50,
              child: Row(
                children: [
                  GestureDetector(onTap:(){
                    setState(() {
                      lst.removeAt(index);
                    });
                  },child: Icon(Icons.delete)),
                  GestureDetector(onTap:(){
                    setState(() {
                      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("Type any number"),
          content: TextField(
            onChanged: (value){
              output = value;
            }
          ),
          actions: [
          ElevatedButton(onPressed: (){
            setState(() {
              lst.replaceRange(index, index+1, {output});
            });
            Navigator.of(context).pop();
          }, child: Text("Edit")),
          ]
        );
      }
      );
                    });
                  },child: Icon(Icons.edit)),
                ],
              ),
            ),
          ),
        );
      },
    ),
    floatingActionButton: FloatingActionButton(onPressed: (){
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("Type any number"),
          content: TextField(
            onChanged: (value){
              output = value;
            }
          ),
          actions: [
          ElevatedButton(onPressed: (){
            setState(() {
              lst.add(output);
            });
            Navigator.of(context).pop();
          }, child: Text("Add")),
          ]
        );
      }
      );
    },child: Text("Add"),
    ),
    );
  }
}