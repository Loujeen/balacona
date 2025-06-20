import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testttt/App_Colors.dart';
import 'package:testttt/providers/list_provider.dart';
import 'package:testttt/providers/auth_user_provider.dart';
import 'package:testttt/screens/add_plant/plant_list_item.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:testttt/screens/add_plant/add_plant_bottom_sheet.dart';

class TaskListTab extends StatefulWidget {
  static const String routeName = 'PlantListTab';

  @override
  State<TaskListTab> createState() => _TaskListTabState();
}

class _TaskListTabState extends State<TaskListTab> {

  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    var authProvider = Provider.of<AuthUserProvider>(context);

    if (authProvider.currentUser == null) {
      return const Scaffold(
        body: Center(child: Text("User not logged in")),
      );
    }

    if (listProvider.tasksList.isEmpty) {
      listProvider.getAllTasksFromFireStore(authProvider.currentUser!.id!);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Plants',style: TextStyle(color: AppColors.WhiteColor),),
        backgroundColor: AppColors.primaryDarkColor,
        iconTheme: IconThemeData(color: AppColors.WhiteColor),
      ),
      body: Column(
        children: [
          EasyDateTimeLine(
            initialDate: listProvider.selectDate,
            onDateChange: (selectedDate) {
              listProvider.changeSelectDate(
                  selectedDate, authProvider.currentUser!.id!);
            },
            activeColor: const Color(0xff5D9CEC),
            dayProps: const EasyDayProps(
              todayHighlightStyle: TodayHighlightStyle.withBackground,
              todayHighlightColor: Color(0x6e5d9cec),
            ),
          ),
          Expanded(
            child: listProvider.tasksList.isEmpty
                ? const Center(child: Text("No tasks found for this date"))
                : ListView.builder(
              itemBuilder: (context, index) {
                return TaskListItem(task: listProvider.tasksList[index]);
              },
              itemCount: listProvider.tasksList.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryDarkColor,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(50)
        // ),
        onPressed: (){
          showAddTaskBottomSheet();
        },
        child: Icon(Icons.add ,  color: AppColors.primaryLightColor, size: 30,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  void showAddTaskBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) => AddTaskBottomSheet()
    );
  }
}
