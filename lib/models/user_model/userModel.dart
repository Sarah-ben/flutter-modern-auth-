import 'dart:core';

class UserModel{
 String? name;
 String? email;
 int? phone;
 String? uid;

 UserModel(this.name, this.email, this.phone, this.uid);

  Map<String,dynamic>toMap(){
   return {
     'name':name,
     'email':email,
     'phone':phone,
     'uid':uid,
   };

 }

}