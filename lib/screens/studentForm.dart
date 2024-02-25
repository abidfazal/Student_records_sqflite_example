import 'package:flutter/material.dart';
import 'package:student_records/screens/HomePage.dart';
import 'package:student_records/screens/Models/Utils/SQLhelper.dart';
import 'package:student_records/screens/Models/student.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({super.key});

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {

  final _formkey = GlobalKey();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _enrollment_id = TextEditingController();
  final TextEditingController _department = TextEditingController();
  final TextEditingController _semester = TextEditingController();
  final _selectedIndex = 0;
      void done()async{
       await SQLHelper().insertStudent(
        Student(sName: _name.text,
         enrollNo: 1106243, sDep: _department.text,
          sSem: _semester.text));
       Navigator.pop(context);
    }
   
   
  @override
  void dispose() {
    super.dispose();
    _name.dispose();
  }
  @override
  Widget build(BuildContext context) {



    return Scaffold(

     appBar: AppBar(title: const Text('Enter Record',
     style: TextStyle(fontWeight: FontWeight.bold),),centerTitle: true,
     backgroundColor: Colors.purple.shade300,),
     body:  Padding(
      padding: EdgeInsets.all(5)
      ,
      child: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 8,right: 8,top: 5,bottom: 10),
              child: TextFormField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: 'Enter Name'
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return 'please enter name';
                  }
                  else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 8,right: 8,top: 5,bottom: 10),
              child: TextFormField(
                controller: _enrollment_id,
                decoration: InputDecoration(
                  hintText: 'Enter Enrollment id'
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return 'please enter enrollment id';
                  }else{
                    return null;
                  }
                },
              ),
            ),
                                   Container(
              margin: EdgeInsets.only(left: 8,right: 8,top: 5,bottom: 10),
              child: TextFormField(
                controller: _department,
                decoration: InputDecoration(
                  hintText: 'Enter Departement Name'
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return 'please enter Department Name';
                  }else{
                    return null;
                  }
                },
              ),
            ),
              Container(
              margin: EdgeInsets.only(left: 8,right: 8,top: 5,bottom: 10),
              child: TextFormField(
                controller: _semester,
                decoration: InputDecoration(
                  hintText: 'Enter Semester'
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return 'please enter semester';
                  }else{
                    return null;
                  }
                },
              ),
            ),

           ElevatedButton(onPressed: (){
            setState(() {
              done();     
               Navigator.pop(context);  
            });
            
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Data'),));
           }, 
           child: Text('Submit',
           style: TextStyle(fontWeight: FontWeight.bold),)),
          ],

        
        )),
        
      ),
      
      
    );
  }
}