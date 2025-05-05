import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testttt/App_Colors.dart';
import '../models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person),
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.04),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text('@handle • ${post.timeAgo}', style: TextStyle(color: AppColors.DarkGreyColor, fontSize: 14)),
                ],
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          Text(post.caption, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
          if (post.quoted != null)
            Container(
              margin: EdgeInsets.only(top: 8),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primaryLightColor,
              ),
              child: Text(post.quoted!, style: TextStyle(fontSize: 15)),
            ),
          SizedBox(height:  MediaQuery.of(context).size.height*0.02),
          Row(
            children: [
              Icon(Icons.comment, size: 21, color: AppColors.DarkGreyColor),
              SizedBox(width: MediaQuery.of(context).size.width*0.01),
              Text("11", style: TextStyle(fontSize: 14)),
              SizedBox(width: MediaQuery.of(context).size.width*0.05),
              Icon(Icons.repeat, size: 21, color: AppColors.DarkGreyColor),
              SizedBox(width: MediaQuery.of(context).size.width*0.01),
              Text("270", style: TextStyle(fontSize: 14)),
              SizedBox(width: MediaQuery.of(context).size.width*0.05),
              Icon(Icons.favorite_border, size: 21, color: AppColors.DarkGreyColor),
              SizedBox(width: MediaQuery.of(context).size.width*0.01),
              Text("1,869", style: TextStyle(fontSize: 14)),
              SizedBox(width: MediaQuery.of(context).size.width*0.05),
              Icon(Icons.bar_chart, size: 21, color: AppColors.DarkGreyColor),
              SizedBox(width: MediaQuery.of(context).size.width*0.01),
              Text("99.6k", style: TextStyle(fontSize: 14)),
              Spacer(),
              Icon(Icons.share_outlined, size: 21, color: AppColors.DarkGreyColor),
            ],
          )
        ],
      ),
    );
  }
}
