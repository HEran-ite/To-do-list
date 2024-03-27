// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:part2/pages/utils/my_button.dart';
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key , 
    required this.controller,
    required this.onSave,
    required this.onCancel,
    });


  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      backgroundColor: const Color.fromARGB(255, 192, 218, 237),
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Add new task'
                
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(text: 'Save', onPressed: onSave),

                MyButton(text: 'Cancel', onPressed: onCancel)
              ],
            )
          ],),
      ),
    );
  }
}