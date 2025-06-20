import 'package:testttt/providers/list_provider.dart';
import 'package:testttt/providers/auth_user_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testttt/Register/registerScreen.dart';
import 'package:testttt/screens/GameScreen.dart';
import 'package:testttt/screens/community_screen.dart';
import 'package:testttt/screens/home_location_screen.dart';
import 'package:testttt/screens/location_screen.dart';
import 'package:testttt/screens/login_screen.dart';
import 'package:testttt/Home_Screen/Home_Screen.dart';
import 'package:testttt/Home_Screen/LearnAboutPlants.dart';
import 'package:testttt/Home_Screen/Popularplant.dart';
import 'package:testttt/Home_Screen/know_about_plants_screen.dart';
import 'package:testttt/LoginSignup.dart';
import 'package:testttt/Profile/edit_information.dart';
import 'package:testttt/Profile/profileScreen.dart';
import 'package:testttt/search_screen.dart';
import 'package:testttt/firebase_options.dart';
import 'package:testttt/screens/add_plant/add_plant_bottom_sheet.dart';
import 'package:testttt/screens/add_plant/plant_list_item.dart';
import 'package:testttt/screens/add_plant/edit_plant_page.dart';
import 'package:testttt/screens/add_plant/plant_list_tab.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testttt/model/plant.dart';
import 'package:testttt/model/my_user.dart';
import 'package:provider/provider.dart';
import 'package:testttt/App_Colors.dart';
import 'package:testttt/firebase_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testttt/providers/auth_user_provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:testttt/my_theme_data.dart';


class TaskListItem extends StatefulWidget {
  Task task;
  TaskListItem({required this.task});

  @override
  State<TaskListItem> createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var listProvider = Provider.of<ListProvider>(context);
    var authProvider = Provider.of<AuthUserProvider>(context);
    return Container(
      margin: EdgeInsets.all(12),
      child: Slidable(
        // The start action pane is the one at the left or the top side.
        startActionPane: ActionPane(
          extentRatio: 0.25,
          // A motion is a widget used to control how the pane animates.
          motion: const ScrollMotion(),
          // All actions are defined in the children parameter.
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              borderRadius: BorderRadius.circular(15),
              onPressed: (context) {
                FirebaseUtils.deleteTaskFromFireStore(
                    widget.task, authProvider.currentUser!.id!)
                    .then((value) {
                  print('Plant deleted successfully');
                  listProvider.getAllTasksFromFireStore(
                      authProvider.currentUser!.id!);
                }).timeout(Duration(milliseconds: 500), onTimeout: () {
                  print('Plant deleted successfully');
                  listProvider.getAllTasksFromFireStore(
                      authProvider.currentUser!.id!);
                });
              },
              backgroundColor: AppColors.blackColor,
              foregroundColor: AppColors.WhiteColor,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: InkWell(
          onTap: () async {
            final updatedTask = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditTaskPage(task: widget.task),
              ),
            );
            if (updatedTask != null) {
              setState(() {
                widget.task.title = updatedTask.title;
                widget.task.description = updatedTask.description;
                widget.task.dateTime = updatedTask.dateTime;
              });
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.WhiteColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(12),
                  color: isDone
                      ? AppColors.primaryDarkColor
                      : AppColors.primaryDarkColor,
                  width: width * 0.01,
                  height: height * 0.1,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.task.title,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: isDone
                                ? AppColors.primaryDarkColor
                                : AppColors.primaryDarkColor,
                            fontSize: 22),
                      ),
                      Text(
                        widget.task.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isDone
                        ? AppColors.primaryLightColor.withOpacity(0)
                        : AppColors.primaryDarkColor,
                  ),
                  child: isDone
                      ? Text(
                    "Done!",
                    style: TextStyle(
                        color: AppColors.primaryDarkColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )
                      : IconButton(
                      onPressed: () {
                        setState(() {
                          isDone = true;
                        });
                      },
                      icon: Icon(
                        Icons.check,
                        size: 35,
                        color: AppColors.WhiteColor,
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class TaskListItem extends StatefulWidget {
//   Task task;
//   TaskListItem({required this.task});
//
//   @override
//   State<TaskListItem> createState() => _TaskListItemState();
// }
//
// class _TaskListItemState extends State<TaskListItem> {
//   bool isDone = false;
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     var listProvider = Provider.of<ListProvider>(context);
//     var authProvider = Provider.of<AuthUserProvider>(context);
//     return Container(
//       margin: EdgeInsets.all(12),
//       child: Slidable(
//
//         // The start action pane is the one at the left or the top side.
//         startActionPane: ActionPane(
//           extentRatio: 0.25,
//           // A motion is a widget used to control how the pane animates.
//           motion: const ScrollMotion(),
//           // All actions are defined in the children parameter.
//           children: [
//             // A SlidableAction can have an icon and/or a label.
//             SlidableAction(
//               borderRadius: BorderRadius.circular(15),
//               onPressed: (context){
//                 FirebaseUtils.deleteTaskFromFireStore(widget.task,authProvider.currentUser!.id!)
//                 .then((value) {
//                   print('Task deleted successfully');
//                   listProvider.getAllTasksFromFireStore(authProvider.currentUser!.id!);
//                 }
//                 )
//                     .timeout(
//                   Duration(milliseconds: 500),onTimeout: (){
//                     print('Task deleted successfully');
//                     listProvider.getAllTasksFromFireStore(authProvider.currentUser!.id!);
//                 }
//                 );
//               },
//               backgroundColor: AppColors.redColor,
//               foregroundColor: AppColors.whiteColor,
//               icon: Icons.delete,
//               label: 'Delete',
//             ),
//           ],
//         ),
//         child: InkWell(
//           onTap: () async {
//             final updatedTask = await Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => EditTaskPage(task: widget.task),
//               ),
//             );
//             if (updatedTask != null) {
//               setState(() {
//                 widget.task.title = updatedTask.title;
//                 widget.task.description = updatedTask.description;
//                 widget.task.dateTime = updatedTask.date;
//               });
//             }
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: AppColors.whiteColor
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   margin: EdgeInsets.all(12),
//                   color: isDone ?
//                   AppColors.greenColor
//                   :
//                   AppColors.primaryColor,
//                   width: width*0.01,
//                   height: height*0.1,
//                 ),
//                 Expanded(child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                   Text(widget.task.title ,
//                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                       color: isDone ?
//                       AppColors.greenColor
//                           :
//                       AppColors.primaryColor,
//                     fontSize: 22
//                   ),
//                   ),
//                   Text(widget.task.description,
//                     style: Theme.of(context).textTheme.bodyMedium
//                   ),
//                 ],
//                 )
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(8),
//                   padding: EdgeInsets.symmetric(horizontal: 4),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: isDone ?
//                     AppColors.greenColor.withOpacity(0)
//                         :
//                     AppColors.primaryColor,
//                   ),
//                   child: isDone?
//                       Text(
//                         "Done!",
//                         style: TextStyle(
//                             color: AppColors.greenColor,
//                             fontSize: 25,
//                             fontWeight: FontWeight.bold
//                         ),
//                       )
//                   :
//                   IconButton(
//                       onPressed: (){
//                         setState(() {
//                           isDone = true;
//                         });
//                       },
//                       icon: Icon(Icons.check , size:  35 , color: AppColors.whiteColor,)),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }