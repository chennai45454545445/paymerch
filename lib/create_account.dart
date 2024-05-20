import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paymerch/signin_otp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _State();
}
void _navigateToNextScreen1(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignIn()));
}
class _State extends State<CreateAccount> {
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  int page=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // TOP IMAGE
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'image/assets1.jpg',
                    width: 250,
                    height: 250,
                  ),
                ],
              ),
            ),
            Container(
              height: 450,
              width: 330,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 25, top: 10),
                    child: Row(
                      children: [
                        Text(
                          "Create Account",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "One",
                              fontSize: 23),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 20, right: 20),
                    width: 300,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(239, 239, 239, 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DefaultTabController(
                        length: 2,
                        child: TabBar(
                          dividerColor: Colors.transparent,
                          indicatorSize: TabBarIndicatorSize.tab,
                          onTap: (value){
                            setState(() {
                              page=value;
                            });
                          },
                          indicator: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
        
                          ),
                          tabs: [
                            Tab(
                              child: Text("Email", style: TextStyle(color: Colors.black, fontFamily: "One"),),
                            ),
                            Tab(
                              child: Text("Mobile", style: TextStyle(color: Colors.black, fontFamily: "One"),),
                            )
                          ],
        
                        )
                    ),
        
                  ),
                  // TAB CONTROLLER WORKING
                  page==0? Column(
                    children: [
                      //@Email Id
                      Container(
                        margin: EdgeInsets.only(left: 25, top: 20),
                        child: Row(
                          children: [
                            Text("@ Email Id", style: TextStyle(color: Colors.black, fontFamily: "One", fontSize: 18),),
                          ],
                        ),
                      ),
                      // Text Field
                      Container(
                        margin: EdgeInsets.only(left: 25, right: 25, top: 25),
                        height: 45,
                        child: TextField(
                          controller: email,
                          style: TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                            hintText: "Enter Your Email",
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                width: 0.5,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Colors.grey,
                              )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  width: 0.5,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                  color: Colors.grey,
                                )
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25, right: 25, top: 25),
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                              width: 0.4
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.0, 1.0],
                            colors: [
                              Color.fromARGB(255, 7, 136, 195),
                              Color.fromARGB(255, 132, 220, 255),
                            ],
                          ),
                        ),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              minimumSize: Size(300, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
        
                              ),
                            ),
                            onPressed: () async {
                                 if(email.text.toString()!="demo@gmail.com"){
                                   Fluttertoast.showToast(msg: "Enter Correct Email");
                                 }
                                 else{
                                   SharedPreferences sp  = await  SharedPreferences.getInstance();
                                   sp.setString("email",email.text.toString());
                                   _navigateToNextScreen1(context);
                                 }
                            }, child: Text("Continue", style: TextStyle(color: Colors.white, fontFamily: "One"),)
                        ),
                      ),
        
                    ],
                  ):
                           Column(
                    children: [
                      //@Email Id
                      Container(
                        margin: EdgeInsets.only(left: 25, top: 20),
                        child: Row(
                          children: [
                            Text("Mobile Number", style: TextStyle(color: Colors.black, fontFamily: "One", fontSize: 18),),
                          ],
                        ),
                      ),
                      // Text Field
                      Container(
                        margin: EdgeInsets.only(left: 25, right: 25, top: 25),
                        height: 45,
                        child: TextField(
                          style: TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                              hintText: "Enter Your Mobile",
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    width: 0.5,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                    color: Colors.grey,
                                  )
                              )
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25, right: 25, top: 25),
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                              width: 0.4
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.0, 1.0],
                            colors: [
                              Color.fromARGB(255, 7, 136, 195),
                              Color.fromARGB(255, 132, 220, 255),
                            ],
                          ),
                        ),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              minimumSize: Size(300, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
        
                              ),
                            ),
                            onPressed: (){
                              _navigateToNextScreen1(context);
                            }, child: Text("Sign In", style: TextStyle(color: Colors.white, fontFamily: "One"),)
                        ),
                      ),
        
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(246, 246, 246, 2),
                borderRadius: BorderRadius.circular(20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
