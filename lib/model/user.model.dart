class User{
  String id;
  String name;
  int age;

  User({this.id='', required this.name, required this.age});
//convertir un objet au collection
  Map<String, dynamic> toJson(){
    return{
      'id':id,
      'name':name,
      'age':age,
    };
  }
//convetrir collection au objet
factory User.formJson(Map<String, dynamic> json){
    return User(id: json['id'], name: json['name'], age:json['age'] );
}
}