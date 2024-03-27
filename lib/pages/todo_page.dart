// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, unused_element, must_call_super
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:part2/data/database.dart';
import 'package:part2/pages/utils/dialog_box.dart';
import 'package:part2/pages/utils/todo_tiles.dart';


class ToDOPage extends StatefulWidget {
  const ToDOPage({super.key});

  @override
  State<ToDOPage> createState() => _ToDOPageState();
}



class _ToDOPageState extends State<ToDOPage> {

  TextEditingController myController = TextEditingController();
  String greet ='';
  void greetUser(){
    setState(() {
      
   greet='hello'+ myController.text;
    });
  }
  final _myBox= Hive.box('myBox');
  final _controller=TextEditingController();


 
  ToDoDatabase db = ToDoDatabase();
  void checkBoxChanged (bool? value , int index){
    setState(() {
      db.toDoList[index][1]= ! db.toDoList[index][1];
      db.updateDataBase();
    });

  }
  @override
  void initState(){

    if (_myBox.get('TODOLIST')==null){
      db.createInitialData();
    }
    else {
      db.loadData();
    }

  }

  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text,false]);
      _controller.clear();
      db.updateDataBase();
    });
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
      db.updateDataBase();
    });
  }

  void createNewTask () {
    showDialog(
      context: context, 
      builder: (context){
      return DialogBox(
        controller:_controller ,
        onCancel:()=>Navigator.of(context).pop() ,
        onSave:saveNewTask ,
      );
        
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 192, 218, 237),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 72, 151, 215),
        title: Text('TO DO'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:createNewTask,
        child:Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 72, 151, 215),
      ),
      body: ListView.builder(
       
          itemCount: db.toDoList.length,
          itemBuilder: (context,index){
            return ToDoTiles(
              taskName: db.toDoList[index][0], 
              completed: db.toDoList[index][1], 
              onChanged:(value) => checkBoxChanged(value,index),
              deleteFunction:(context)=> deleteTask (index),
              
              );
              
          },
          
          
      )
      );
     
    
  }
}