import 'package:flutter/material.dart';
import 'package:mp_player/homescreen/home_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       children: [
         Row(
           children: [
             InkWell(
               onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
               },
               child: Padding(
                 padding: const EdgeInsets.only(top: 60 , left: 20),
                 child: Icon(Icons.arrow_back_ios),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 60 , left: 15),
               child: CircleAvatar(
                 radius: 30,
                 backgroundImage: AssetImage('asset/img/p.jpg'),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 60 , left: 20),
               child: Text('Anjali Purohit' , style: TextStyle(fontSize: 30),),
             ),
           ],
         ),
         Divider(
           color: Colors.black,
         ),
         SizedBox(height: 20,),
         Column(
           children: [
             Row(
               children: [
                 SizedBox(width: 20,),
                 Icon(Icons.add , size: 30,),
                 SizedBox(width: 10,),
                 Text('Add Account' , style: TextStyle(fontSize: 30),)
               ],
             ),
             SizedBox(height: 20,),
             Row(
               children: [
                 SizedBox(width: 20,),
                 Icon(Icons.electric_bolt_outlined , size: 30,),
                 SizedBox(width: 10,),
                 Text("What's New" , style: TextStyle(fontSize: 30),)
               ],
             ),
             SizedBox(height: 20,),
             Row(
               children: [
                 SizedBox(width: 20,),
                 Icon(Icons.access_time_rounded , size: 30,),
                 SizedBox(width: 10,),
                 Text("Listning History" , style: TextStyle(fontSize: 30),)
               ],
             ),
             SizedBox(height: 20,),
             Row(
               children: [
                 SizedBox(width: 20,),
                 Icon(Icons.settings , size: 30,),
                 SizedBox(width: 10,),
                 Text("Settings and Privacy" , style: TextStyle(fontSize: 30),)
               ],
             ),
             SizedBox(height: 20,),
             Row(
               children: [
                 SizedBox(width: 20,),
                 Icon(Icons.edit , size: 30,),
                 SizedBox(width: 10,),
                 Text("Edit Your Profile" , style: TextStyle(fontSize: 30),)
               ],
             ),
           ],
         ),
         Padding(
           padding: const EdgeInsets.only(top: 300),
           child: Column(
             children: [
               Container(
                 height: 100,
                 width: 150,
                 child: Image.asset('asset/img/l.png'),
                 ),
               Text('MP3 Player' , style: TextStyle(fontSize: 20),)
             ],
           ),
         ),
         

       ],
     ),
    );
  }
}
