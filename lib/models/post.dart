import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String caption;
  final String? quoted;
  final Timestamp timestamp;
  final int likes;
  final int comments;
  final int shares;

  Post({
    required this.caption,
    this.quoted,
    required this.timestamp,
    this.likes = 0,
    this.comments = 0,
    this.shares = 0,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      caption: map['caption'] ?? '',
      quoted: map['quoted'],
      timestamp: map['timestamp'] ?? Timestamp.now(),
      likes: map['likes'] ?? 0,
      comments: map['comments'] ?? 0,
      shares: map['shares'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'caption': caption,
      'quoted': quoted,
      'timestamp': timestamp,
      'likes': likes,
      'comments': comments,
      'shares': shares,
    };
  }

  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(timestamp.toDate());
    if (difference.inMinutes < 1) return "Just now";
    if (difference.inMinutes < 60) return "${difference.inMinutes}m";
    if (difference.inHours < 24) return "${difference.inHours}h";
    return "${difference.inDays}d";
  }
}
