class Usermodel {
  int? id;
  String name;
  String email;

  Usermodel({this.id, required this.name, required this.email});

  Map<String, dynamic> toMap(){
    return ({
      'id': id,
      'name': name,
      'email': email
    });
  }

  static Usermodel fromMap(Map<String, dynamic> map){
    return Usermodel(
      id: map['id'],
      name: map['name'], 
      email: map['email']
      );
  }
}
