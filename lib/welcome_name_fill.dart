import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paymerch/home_page.dart';

class WelcomeName extends StatefulWidget {
  const WelcomeName({super.key});

  @override
  State<WelcomeName> createState() => _State();
}
void _navigateToNextScreen1(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
}
class _State extends State<WelcomeName> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
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
                    'image/assets3.jpg',
                    width: 250,
                    height: 250,
                  ),
                ],
              ),
            ),
            // Welcome!
            Container(
              height: 450,
              width: 330,
              child: Column(
                children: [
                  // Top Image
                  Container(
                    margin: EdgeInsets.only(left: 25, top: 10),
                    child: Row(
                      children: [
                        Text(
                          "Welcome!",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "One",
                              fontSize: 23),
                        ),
                      ],
                    ),
                  ),
                  //First Name
                  Container(
                    margin: EdgeInsets.only(left: 25, top: 30),
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        Text("First Name",style: TextStyle(
                            color: Colors.black,
                            fontFamily: "One",
                            fontSize: 15),),

                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25, top: 5),
                    height: 45,
                    child: TextField(
                      controller: firstName,
                      style: TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                        hintText: "Enter Your First Name",
                        hintStyle: TextStyle(fontSize: 13),
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
                  //Last Name
                  Container(
                    margin: EdgeInsets.only(left: 25, top: 10),
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        Text("Last Name",style: TextStyle(
                            color: Colors.black,
                            fontFamily: "One",
                            fontSize: 15),),

                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25, top: 5),
                    height: 45,
                    child: TextField(
                      controller: lastName,
                      style: TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                        hintText: "Enter Your Last Name",
                        hintStyle: TextStyle(fontSize: 13),
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
                  // Button
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25, top: 30),
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
                         if(firstName.text!="demo"){
                           Fluttertoast.showToast(msg: "Enter Valid User Name");
                         }
                         else if(lastName.text!="id"){
                           Fluttertoast.showToast(msg: "Enter Valid Last Name");
                         }
                         else{
                           _navigateToNextScreen1(context);
                         }
                        }, child: Text("Create Account", style: TextStyle(color: Colors.white, fontFamily: "One"),)
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(246, 246, 246, 2),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
