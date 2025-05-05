import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: const Icon(Icons.person),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
                  Text('@handle • ${post.timeAgo}', style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(post.caption, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
          if (post.quoted != null)
            Container(
              margin: EdgeInsets.only(top: 8.h),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green.shade100),
                borderRadius: BorderRadius.circular(10),
                color: Colors.green.shade50,
              ),
              child: Text(post.quoted!, style: TextStyle(fontSize: 13.sp)),
            ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Icon(Icons.comment, size: 18.sp, color: Colors.grey),
              SizedBox(width: 5.w),
              Text("11", style: TextStyle(fontSize: 12.sp)),
              SizedBox(width: 15.w),
              Icon(Icons.repeat, size: 18.sp, color: Colors.grey),
              SizedBox(width: 5.w),
              Text("270", style: TextStyle(fontSize: 12.sp)),
              SizedBox(width: 15.w),
              Icon(Icons.favorite_border, size: 18.sp, color: Colors.grey),
              SizedBox(width: 5.w),
              Text("1,869", style: TextStyle(fontSize: 12.sp)),
              SizedBox(width: 15.w),
              Icon(Icons.bar_chart, size: 18.sp, color: Colors.grey),
              SizedBox(width: 5.w),
              Text("99.6k", style: TextStyle(fontSize: 12.sp)),
              const Spacer(),
              Icon(Icons.share_outlined, size: 18.sp, color: Colors.grey),
            ],
          )
        ],
      ),
    );
  }
}
