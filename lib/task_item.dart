import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_c11_online/app_colors.dart';
import 'package:todo_c11_online/firebase_functions.dart';
import 'package:todo_c11_online/models/task_model.dart';

class TaskItem extends StatelessWidget {
  TaskModel taskModel;

  TaskItem({required this.taskModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      margin: EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Slidable(
        startActionPane:
        ActionPane(motion: DrawerMotion(), extentRatio: .6, children: [
          SlidableAction(
            onPressed: (context) {
              FirebaseFunctions.deleteTask(taskModel.id);
            },
            label: "Delete",
            backgroundColor: Colors.red,
            icon: Icons.delete,
            spacing: 8,
            padding: EdgeInsets.zero,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), bottomLeft: Radius.circular(25)),
          ),
          SlidableAction(
            onPressed: (context) {},
            label: "Edit",
            backgroundColor: Colors.blue,
            icon: Icons.edit,
            spacing: 8,
          ),
        ]),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 4,
                decoration: BoxDecoration(
                    color: taskModel.isDone ? Colors.green : AppColors.primary,
                    borderRadius: BorderRadius.circular(25)),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      taskModel.title,
                      style: TextStyle(
                        fontSize: 18,
                        color:
                        taskModel.isDone ? Colors.green : AppColors.primary,
                      ),
                    ),
                    Text(
                      taskModel.subTitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              taskModel.isDone
                  ? Text(
                "DONE!!",
                style: TextStyle(color: Colors.green, fontSize: 22),
              )
                  : ElevatedButton(
                onPressed: () {
                  taskModel.isDone = true;
                  FirebaseFunctions.updateTask(taskModel);
                  Future.delayed(Duration(seconds: 4), () {
                    FirebaseFunctions.deleteTask(taskModel.id);
                  },);
                },
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 30,
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
