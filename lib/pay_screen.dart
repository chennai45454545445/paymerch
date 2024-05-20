import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paymerch/payment_successfull.dart';
import 'send_money.dart';

class PayScreen extends StatefulWidget {
  PayScreen(this.data,  {super.key});
  var data;
  @override
  State<PayScreen> createState() => _State();
}
void _navigateToNextScreen1(BuildContext context, List myList, TextEditingController amount) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentDone(myList, amount.text)));
}
String c='';
class _State extends State<PayScreen> {
  TextEditingController amount = TextEditingController();
  bool payScreen=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Container(
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back_ios_new_outlined)),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(widget.data["image"].toString()),
                      Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Text(
                            widget.data["name"].toString(),
                            style: TextStyle(fontFamily: "One", fontSize: 29),
                          )),
                      Text(widget.data["mobile"].toString(),
                          style: TextStyle(
                              fontFamily: "Three",
                              fontSize: 15,
                              color: Colors.grey)),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Text(
                              "PayTag: ",
                              style: TextStyle(fontFamily: "One", fontSize: 20),
                            ),
                            Text(
                              widget.data["id"].toString(),
                              style: TextStyle(fontFamily: "One", fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Text("You Are Paying",
                              style:
                                  TextStyle(fontFamily: "One", fontSize: 15))),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 180,
                        width: 300,
                        child: TextField(
                          onChanged: (text) {
                            setState(() {

                            }); // setState ko call karke widget rebuild karenge
                          },
                          controller: amount,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Three",
                              fontSize: 40),
                          keyboardType: TextInputType.numberWithOptions(),
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            hintText: "Amount",
                            hintStyle:
                                TextStyle(fontSize: 40, color: Colors.grey),
                            contentPadding: EdgeInsets.only(top: 50),
                            prefixIcon: Container(
                                margin: EdgeInsets.only(left: 60),
                                child: Icon(
                                  Icons.currency_rupee,
                                  size: 40,
                                  color: Colors.black,
                                )),
                            fillColor: Color.fromARGB(5, 10, 10, 10),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 130),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 246, 122, 122),
                      minimumSize: Size(250, 60),
                    ),
                    onPressed: () {
                      if(amount.text.isEmpty)
                        Fluttertoast.showToast(msg: "Please Enter Amount", textColor: Colors.white, backgroundColor: Colors.green,);
                      else
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentDone(widget.data, amount.text)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Pay: ", style: TextStyle(fontSize: 30, fontFamily: "One", color: Colors.white),),
                        Text("${amount.text}", style: TextStyle(fontSize: 30, fontFamily: "One", color: Colors.white),),
                      ],
                    )),
              ),// Other widgets to display data from the list
            ],
          ),
        ));
  }
}
