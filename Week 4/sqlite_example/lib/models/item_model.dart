class Item {
  final int? id;
  final String title;
  final String subtitle;

  Item({this.id, required this.title, required this.subtitle});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id, // SQLite handles auto-increment if ID is omitted
      'title': title,
      'subtitle': subtitle,
    };
  }
}