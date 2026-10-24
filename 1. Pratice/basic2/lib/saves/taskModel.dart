class Taskmodel {
  int? id;
  String title;
  String description;
  Taskmodel({this.id, required this.title, required this.description});

  Map<String, dynamic> toMap(){
    return ({
      "id": id,
      "title": title,
      "description": description
    });
  }

  factory fromMap(Map<String, dynamic> map){
    return Taskmodel(id: map['id'] ,title: map['title'], description: map['description']);
  }
}