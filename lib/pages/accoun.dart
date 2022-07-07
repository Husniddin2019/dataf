import 'package:dataf/model/user_model.dart';
import 'package:dataf/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';

import '../model/user_model.dart';
import '../model/user_model.dart';
class account extends StatefulWidget {
  const account({Key? key}) : super(key: key);


  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
  final useremailController = TextEditingController();
  final numberController = TextEditingController();
  final adressController = TextEditingController();
  void dologin(){
    String email = useremailController.text.toString().trim();
    String number = numberController.text.toString().trim();
    String adress = adressController.text.toString().trim();
    var Account1 = new Account (email: email,number: number, adress:adress);
    var box = Hive.box('pdp_online');
    box.put("account", Account1.toJson());
    var Account2 = new Account.fromJson(box.get('account'));
    print(Account2.email);
    print(Account2.number);
    print(Account2.adress);

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.teal.shade800,
                  Colors.teal.shade800,
                  Colors.teal.shade800,
                ]
            )
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80,),
            // #login, #welcome
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 5,),
                  Text("Welcome",style: TextStyle(color: Colors.grey,fontSize: 20),),
                  SizedBox(height: 5,),
                  Text("Sign in",style: TextStyle(color: Colors.white,fontSize: 30),),
                ],
              ),
            ),
            SizedBox(height: 20,),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        // #email, #password
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),


                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("  Email",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                              Container(
                                padding: EdgeInsets.only(left: 10,right: 10),
                                child: TextField(
                                  controller: useremailController,
                                  decoration: InputDecoration(
                                      hintText: "baxti@pdp.uz",
                                      hintStyle: TextStyle(color: Colors.grey.shade500),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),

                              Text("  Number",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                              Container(
                                padding: EdgeInsets.only(left: 10,right: 10),
                                child: TextField(
                                  controller: numberController,
                                  decoration: InputDecoration(
                                      hintText: "+99890123456789",
                                      hintStyle: TextStyle(color: Colors.grey.shade500),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),


                              Text("  Adress",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                              Container(
                                padding: EdgeInsets.all(10),

                                child: TextField(
                                  controller: adressController,
                                  decoration: InputDecoration(
                                      hintText: "manzilni kiriting",
                                      hintStyle: TextStyle(color: Colors.grey.shade500),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),

                        SizedBox(height: 15,),
                        // #SIGN in
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.teal
                          ),
                          child: Center(
                            child: TextButton(onPressed: (){dologin();}, child: Text("SIGN IN",style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold,),),)
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("OR?",style: TextStyle(color: Colors.grey.shade500,),),
                        Row(
                          children: [
                            Expanded(
                              child: IconButton(onPressed: (){}, icon: Icon(Icons.facebook,color: Colors.blueAccent.shade700,)),
                            ),
                            SizedBox(width: 5,),
                            Expanded(
                              child: IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.twitter,color: Colors.lightBlueAccent,)),
                            ),

                            SizedBox(width: 5,),
                            Expanded(
                              child: IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.instagram,color: Colors.pink,)),


                            ),
                          ],
                        ),
                        SizedBox(height: 15,),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
