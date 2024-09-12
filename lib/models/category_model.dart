class Category {
  String id;
  String name;

  Category({
    required this.id,
    required this.name,
  });

  // Convert a Category to JSON
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  // Convert JSON to a Category
  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'],
        name: json['name'],
      );
}
