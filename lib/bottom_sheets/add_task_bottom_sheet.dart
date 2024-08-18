import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_c11_online/app_colors.dart';
import 'package:todo_c11_online/firebase_functions.dart';
import 'package:todo_c11_online/models/task_model.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate = DateTime.now();

  var titleController = TextEditingController();
  var subTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add New Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                  label: Text("Title"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18))),
            ),
            SizedBox(
              height: 18,
            ),
            TextFormField(
              controller: subTitleController,
              decoration: InputDecoration(
                  label: Text("Description"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18))),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              "Select Time",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            InkWell(
              onTap: () {
                selectDataFun();
              },
              child: Text(
                selectedDate.toString().substring(0, 10),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            ElevatedButton(
              onPressed: () {
                print("Here >> ${DateUtils.dateOnly(selectedDate)}");
                TaskModel task = TaskModel(
                    title: titleController.text,
                    subTitle: subTitleController.text,
                    userId: FirebaseAuth.instance.currentUser!.uid,
                    date: DateUtils.dateOnly(selectedDate)
                        .millisecondsSinceEpoch);

                FirebaseFunctions.addTask(task);
                Navigator.pop(context);
              },
              child: Text(
                "Add Task",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              style:
                  ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            )
          ],
        ),
      ),
    );
  }

  selectDataFun() async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }
}
