import 'package:flutter/material.dart';
import 'package:todo_c11_online/app_colors.dart';
import 'package:todo_c11_online/bottom_sheets/add_task_bottom_sheet.dart';
import 'package:todo_c11_online/tabs/settings_tab.dart';
import 'package:todo_c11_online/tabs/tasks_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomE";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          "ToDo App",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddTaskBottomSheet(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: Colors.white,
            width: 4,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        notchMargin: 8,
        padding: EdgeInsets.zero,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.grey,
            showUnselectedLabels: false,
            currentIndex: selectedIndex,
            onTap: (value) {
              selectedIndex = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings"),
            ]),
      ),
      body: tabs[selectedIndex],
    );
  }

  String x="x>6 : true";
  List<Widget> tabs = [TasksTab(), SettingsTab()];
}

// "Select * from TableName w"
// "insert into tableName"
