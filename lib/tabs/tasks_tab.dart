import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_c11_online/app_colors.dart';
import 'package:todo_c11_online/firebase_functions.dart';
import 'package:todo_c11_online/task_item.dart';

class TasksTab extends StatefulWidget {
   TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime date=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: date,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (dateTime) {
            date=dateTime;
            setState(() {

            });
          },
          leftMargin: 20,
          monthColor: AppColors.grey,
          dayColor: AppColors.primary,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: AppColors.primary,
          dotColor: Colors.white,
          selectableDayPredicate: (date) => date.day != 27,
          locale: 'en',
        ),
        SizedBox(height: 24),
        StreamBuilder(
          stream: FirebaseFunctions.getTasks(date),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  children: [
                    Text("Something went wrong"),
                    ElevatedButton(onPressed: () {}, child: Text("try again"))
                  ],
                ),
              );
            }

            var tasks = snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
            // var tasks = snapshot.data?.docs.map((doc) => doc.data()).toList();
            if (tasks.isEmpty) {
              return Center(
                child: Text("No Tasks"),
              );
            }
            return Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 12,
                ),
                itemBuilder: (context, index) {
                  return TaskItem(taskModel: tasks[index],);
                },
                itemCount: tasks.length,
              ),
            );
          },
        )
      ],
    );
  }
}
