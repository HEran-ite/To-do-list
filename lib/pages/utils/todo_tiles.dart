// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTiles extends StatelessWidget {
    final String taskName;
    final bool completed;
    Function(bool?)? onChanged;
    Function(BuildContext)? deleteFunction;
    ToDoTiles({
      super.key,
      required this.taskName,
      required this.completed,
      required this.onChanged,
      required this.deleteFunction,
      });
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(24),
      child: Slidable(
        endActionPane: ActionPane(
          
          motion: StretchMotion(),
          children: [
            SizedBox(width: 10,),
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Color.fromARGB(255, 202, 84, 75),
              borderRadius: BorderRadius.circular(10),)
          ],
        ),
        child: Container(
            padding: EdgeInsets.all(24),
            child: Row(
            children:[ 
              Checkbox(value: completed, onChanged: onChanged),
              Text(
                taskName,
                style: TextStyle(decoration: completed? TextDecoration.lineThrough :TextDecoration.none),
              )
              
              ]),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 72, 151, 215),
              borderRadius: BorderRadius.circular(12)
            ),
            ),
      )
      );
    
  }
}