class Item {
  final String id;
  final String title;
  final String subtitle;

  Item({required this.id, required this.title, required this.subtitle});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'].toString(),
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id, // Passing the ID manually forces json-server to use it instead of generating a UUID
      'title': title,
      'subtitle': subtitle,
    };
  }
}