import 'package:testttt/providers/list_provider.dart';
import 'package:testttt/providers/auth_user_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:testttt/model/plant.dart';
import 'package:testttt/firebase_utils.dart';
import 'package:testttt/App_Colors.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  late ListProvider listProvider;

  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of<ListProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Add new task",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  TextFormField(
                    onChanged: (text) {
                      title = text;
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Please enter task title";
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: "Enter task title"),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  TextFormField(
                    onChanged: (text) {
                      description = text;
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Please enter task description";
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: "Enter task Description"),
                    maxLines: 4,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    children: [
                      Text(
                        "Select Date",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      showCalendar();
                    },
                    child: Text(
                      "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryLightColor,
                    ),
                    onPressed: () {
                      addTask();
                    },
                    child: Text(
                      "Add",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCalendar() async {
    var chosenDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    selectedDate = chosenDate ?? selectedDate;
    setState(() {});
  }

  void addTask() {
    if (formKey.currentState?.validate() == true) {
      var authProvider = Provider.of<AuthUserProvider>(context, listen: false);

      if (authProvider.currentUser == null) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("You must be logged in to add a task."))
        );
        return;
      }

      Task task = Task(
        title: title,
        description: description,
        dateTime: selectedDate,
        isDone: true,
      );

      FirebaseUtils.addTaskToFireStore(task, authProvider.currentUser!.id!).then((value) {
        print("Task added successfully!");
        listProvider.getAllTasksFromFireStore(authProvider.currentUser!.id!);
        Navigator.pop(context);
      }).timeout(
        Duration(seconds: 1),
        onTimeout: () {
          print("Task added successfully!");
          listProvider.getAllTasksFromFireStore(authProvider.currentUser!.id!);
          Navigator.pop(context);
        },
      );
    }
  }
}
