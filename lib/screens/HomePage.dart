import 'package:flutter/material.dart';
import 'package:student_records/screens/Models/Utils/SQLhelper.dart';
import 'package:student_records/screens/Models/student.dart';
import 'package:student_records/screens/studentForm.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key,required this.title});

  @override
  State<MyHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
 final SQLHelper _sqlHelper = SQLHelper();
 List<Student>? students;

 void _student()async{
  final data = await _sqlHelper.students();
  setState(() {
     students = data ;
  });
 
 }
   @override
  void initState(){
    print('initstate is working');
    super.initState();
     _student();
  }
  
  @override
  void dispose() {
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

       appBar: AppBar(title:Text( widget.title ),centerTitle: true,backgroundColor:
       Theme.of(context).primaryColor),

       body:students!.isEmpty?
       Center(
        child: const Text('No Student Registerd'),
       )
       
       : ListView.builder(    
        itemCount: students!.length,
        itemBuilder: (context, index) { 
          final item = students![index];
          return Card(
            color: Theme.of(context).primaryColor,
            child: ListTile(
              title: Text("Name"),
              subtitle: Text(item.sName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              trailing: Text(item.enrollNo.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
            ),
          ));

        },),
       floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _student();
          });
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const StudentForm(),));
        },child: const Icon(Icons.add),),
    );
  }
}