class Post {
  final String caption;
  final String? quoted;
  final String timeAgo;

  Post({required this.caption, this.quoted, required this.timeAgo});
}

List<Post> posts = [
  Post(
    caption: "Thats it. thats the tweet.",
    quoted: "did you know that some plants can communicate with each other? They use a network of fungi to share resources and warn each other of danger. #plantlife #nature",
    timeAgo: "0m",
  ),
  Post(
    caption: "Gardening is like meditation for me. It’s so relaxing to get my hands dirty and watch things grow. #gardening #naturetherapy",
    timeAgo: "3m",
  ),
  Post(
    caption: "Thats it. thats the tweet.",
    quoted: "Ever noticed how plants seem to lean towards the light? It’s called phototropism, and it’s a pretty cool example of how plants respond to their environment. #science #plants",
    timeAgo: "5m",
  ),
  Post(
    caption: "My new favorite hobby: propagating plants! It’s so satisfying to watch a little cutting grow into a whole new plant. #plantpropagation #DIY",
    timeAgo: "7m",
  ),
];
