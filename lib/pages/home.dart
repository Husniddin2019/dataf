import 'package:dataf/model/user_model.dart';
import 'package:dataf/pages/accoun.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';

class home extends StatefulWidget {
  static final String id = "";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<home> {
final usernameController = TextEditingController();
final passwordController = TextEditingController();
  void dologin(){
    String username = usernameController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    var User1 = new User (username: username,password: password);
    var box = Hive.box('pdp_online');
    box.put("user", User1.toJson());
    var User2 = new User.fromJson(box.get('user'));
    print(User2.username);
    print(User2.password);

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
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: CircleAvatar(
                    radius: 110,
                    backgroundImage: AssetImage('assets/images/1.jpg'),
                  ),),
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
                                 controller: usernameController,
                                  decoration: InputDecoration(
                                      hintText: "baxti@pdp.uz",
                                      hintStyle: TextStyle(color: Colors.grey.shade500),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                              Text("  Password",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                              Container(
                                padding: EdgeInsets.all(10),

                                child: TextField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                      hintText: "parolni tering",
                                      hintStyle: TextStyle(color: Colors.grey.shade500),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        // #forgot
                        Text("Forgot password?",style: TextStyle(color: Colors.grey.shade500,),),
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
                            child: TextButton(onPressed: (){dologin();}, child: Text("SIGN IN",style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold,),)) ,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Accaunt yuqmi sizda?",style: TextStyle(color: Colors.grey.shade500,),),
                            TextButton(

                              child:  Text(
                                'Sign in',
                                style: TextStyle(fontSize: 20,color: Colors.teal),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const account()));
                              }
                              )
                          ],
                        )



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