class Plant {
  final int id;
  final String name;
  final String description;
  final String category;
  final String image;

  Plant({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.image,
  });

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      image: 'http://10.0.2.2:3000${json['image']}', // مهم للمحاكي
    );
  }
}
