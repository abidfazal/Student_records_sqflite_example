import 'dart:convert';

class Student {
  int? sId;
  String sName;
  int enrollNo;
  String sDep;
  String sSem;

  Student({this.sId,
  required this.sName,
  required this.enrollNo ,
   required this.sDep,
   required this.sSem});

Map<String,dynamic> toMap(){
  return {
    'id':sId,
    'name':sName,
    'enrollment_No':enrollNo,
    'department':sDep,
    'semester':sSem
    
  };
} 

factory Student.fromMap(Map<String,dynamic> map){
  return Student(
    sId: map['id']??0, 
    sName: map['name']??'', 
    enrollNo: map['enrollment_No']??0, 
    sDep: map['department']??'', 
    sSem: map['semester']
    );
}

String toJson() => json.encode(toMap());

factory Student.fromJson(String source)=>Student.fromMap(json.decode(source));
   
}