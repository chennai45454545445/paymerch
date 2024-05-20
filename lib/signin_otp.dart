import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paymerch/welcome_name_fill.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _State();
}
void _navigateToNextScreen1(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => WelcomeName()));
}
class _State extends State<SignIn> {
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
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
                    'image/assets2.jpg',
                    width: 250,
                    height: 250,
                  ),
                ],
              ),
            ),
            // Verification
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
                          "Verification",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "One",
                              fontSize: 23),
                        ),
                      ],
                    ),
                  ),
                  // Please Enter Code
                  Container(
                    margin: EdgeInsets.only(left: 25, top: 10),
                    child: Row(
                      children: [
                        Text(
                          "Please Enter 4 Digit Verification Code sent\n"
                              "to demo@gmail.com",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "One",
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  // OTP Section
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 45,
                          width: 50,
                          child: TextField(
                            controller: otp1,
                            keyboardType: TextInputType.numberWithOptions(),
                            maxLength: 1,
                            style: TextStyle(color: Colors.grey),
                            decoration: InputDecoration(
                              counterText: "",
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                 borderSide: BorderSide(
                                   color: Color.fromRGBO(61, 131, 253, 2),
                                   width: 0.7,
                                   strokeAlign: BorderSide.strokeAlignOutside,
                                   style: BorderStyle.solid,
                                 )
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(0, 105, 217, 1),
                                    width: 0.7,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                    style: BorderStyle.solid,
                                  )
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 45,
                          width: 50,
                          child: TextField(
                            controller: otp2,
                            keyboardType: TextInputType.numberWithOptions(),
                            maxLength: 1,
                            style: TextStyle(color: Colors.grey),
                            decoration: InputDecoration(
                              counterText: "",
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(61, 131, 253, 2),
                                    width: 0.7,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                    style: BorderStyle.solid,
                                  )
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(0, 105, 217, 1),
                                    width: 0.7,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                    style: BorderStyle.solid,
                                  )
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 45,
                          width: 50,
                          child: TextField(
                            controller: otp3,
                            keyboardType: TextInputType.numberWithOptions(),
                            maxLength: 1,
                            style: TextStyle(color: Colors.grey),
                            decoration: InputDecoration(
                              counterText: "",
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(61, 131, 253, 2),
                                    width: 0.7,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                    style: BorderStyle.solid,
                                  )
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(0, 105, 217, 1),
                                    width: 0.7,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                    style: BorderStyle.solid,
                                  )
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 45,
                          width: 50,
                          child: TextField(
                            controller: otp4,
                            keyboardType: TextInputType.numberWithOptions(),
                            maxLength: 1,
                            style: TextStyle(color: Colors.grey),
                            decoration: InputDecoration(
                              counterText: "",
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(61, 131, 253, 2),
                                    width: 0.7,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                    style: BorderStyle.solid,
                                  )
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(0, 105, 217, 1),
                                    width: 0.7,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                    style: BorderStyle.solid,
                                  )
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Button Section
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25, top: 10),
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
                              if(otp1.text=='1' && otp2.text=='1' && otp3.text=='1' && otp4.text=='1'){
                                _navigateToNextScreen1(context);
                              }
                              else{
                                Fluttertoast.showToast(msg: "Invalid Otp");
                              }

                        }, child: Text("Submit", style: TextStyle(color: Colors.white, fontFamily: "One"),)
                    ),
                  ),
                  // Resend Otp
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: RichText(
                          text: TextSpan(
                            text: 'Resend Code In  ', // Text to display
                            style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: "Three"), // Style for the entire text
                            children: <TextSpan>[ // List of children TextSpan for different styles
                              TextSpan(
                                text: '59 Sec', // Text to display with a different style
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontFamily: "Three"), // Style for this part of the text
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  )
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
