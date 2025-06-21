import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String caption;
  final String? quoted;
  final Timestamp timestamp;
  final int likes;
  final int comments;
  final int shares;
  final String username;

  Post({
    required this.caption,
    this.quoted,
    required this.timestamp,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.username,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      caption: map['caption'],
      quoted: map['quoted'],
      timestamp: map['timestamp'],
      likes: map['likes'] ?? 0,
      comments: map['comments'] ?? 0,
      shares: map['shares'] ?? 0,
      username: map['username'] ?? 'Anonymous',
    );
  }


  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(timestamp.toDate());

    if (difference.inMinutes < 60) {
      return "${difference.inMinutes}m ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours}h ago";
    } else {
      return "${difference.inDays}d ago";
    }
  }
}




