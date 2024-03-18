class FirestoreUser{
  String? id;
  String? name;
  String? email;
  FirestoreUser({required this.id,required this.name,required this.email});

  FirestoreUser.fromFirestore(Map<String, dynamic> data){
    id = data["id"];
    name = data["name"];
    email = data["email"];
  }

  Map<String,dynamic> toFirestore(){
    return{
      "id":id,
      "name":name,
      "email":email
    };
  }
}