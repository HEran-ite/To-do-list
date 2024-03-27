import 'package:hive/hive.dart';

class ToDoDatabase {

  final _myBox =Hive.box('myBox');
  List toDoList =[];
  void createInitialData () {
    toDoList =[
      ['Drink water',false],
      ['Track expense',false]
    ];
  }
  void loadData () {
    toDoList=_myBox.get('TODOLIST');

  }

  void updateDataBase (){
    _myBox.put('TODOLIST',toDoList);
  }
}