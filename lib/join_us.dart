import 'package:flutter/material.dart';
import 'package:paymerch/create_account.dart';
import 'package:paymerch/signin_otp.dart';

class JoinUs extends StatefulWidget {
  const JoinUs({super.key});

  @override
  State<JoinUs> createState() => _State();
}
void _navigateToNextScreen1(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateAccount()));
}
void _navigateToNextScreen2(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignIn()));
}

class _State extends State<JoinUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 60, left: 30 ),
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Join us today and start your\n"
                      "journey hassle-free!",
                  style: TextStyle(
                    fontFamily: "One",
                    fontSize: 27,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 55, right: 55, top: 40),
            child: Row(
              children: [
                Image.asset('image/money.png', width: 100, height: 100,),
                Spacer(),
                Image.asset('image/wallet.png', width: 100, height: 100,),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 55, right: 55, top: 40),
            child: Row(
              children: [
                Image.asset('image/payment.png', width: 100, height: 100,),
                Spacer(),
                Image.asset('image/cyber.png', width: 100, height: 100,),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 130),
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    minimumSize: Size(300, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                      side: BorderSide(
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: Colors.black,
                        width: 0.4,
                      )
                    ),

                  ),
                    onPressed: (){
                    _navigateToNextScreen1(context);
                    }, child: Text("Create Account", style: TextStyle(color: Colors.black, fontFamily: "One"),)
                ),
              ],
            ),
          ),
          Container(
           height: 40,
            margin: EdgeInsets.only(top: 20),
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
                onPressed: (){}, child: Text("Sign In", style: TextStyle(color: Colors.white, fontFamily: "One"),)
            ),
          ),
        ],
      ),
    );
  }
}
