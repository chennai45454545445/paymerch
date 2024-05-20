import 'package:flutter/material.dart';

class PaymentDone extends StatefulWidget {
   PaymentDone(this.data, this.amount, {super.key});
  var data;
  var amount;

  @override
  State<PaymentDone> createState() => _State();
}

class _State extends State<PaymentDone> {
  bool payScreen=true;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        payScreen = false;
      });
    });
  }
  Widget build(BuildContext context) {
    print("object ${widget.data}");
    return Scaffold(
          body: Column(
            children: [
              if(payScreen)
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 350),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: CircularProgressIndicator(
                              strokeWidth: 9,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              else
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top:80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Payment Successfull", style: TextStyle(fontFamily: "One", fontSize: 32, color: Colors.green),),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(widget.data["image"].toString()),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(widget.data["name"].toString(), style: TextStyle(fontFamily: "One", fontSize: 25),),),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("₹ ", style: TextStyle(fontFamily: "One", fontSize: 35),),
                          Text("${widget.amount.toString()} ", style: TextStyle(fontFamily: "One", fontSize: 35),)         ,
                          Image.asset('image/tick.png', height: 30, width: 30,),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("16 Jan, 06:33PM", style: TextStyle(fontFamily: "Three"),),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Transaction Id: '),
                          Text("${widget.data["transaction"].toString()}"),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 150),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color: Colors.black,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                  width: 0.3,
                                )
                              ),
                            ),
                              onPressed: (){}, icon: Icon(Icons.add, color: Colors.black,), label: Text("Add to family", style: TextStyle(fontFamily: "One", color: Colors.black),)),
                          Spacer(),
                          ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(
                                      color: Colors.black,
                                      strokeAlign: BorderSide.strokeAlignOutside,
                                      width: 0.3,
                                    )
                                ),
                              ),
                              onPressed: (){}, icon: Icon(Icons.add, color: Colors.black), label: Text("Add to favorite", style: TextStyle(fontFamily: "One", color: Colors.black),),)
                        ],
                      ),
                    )
                  ],
                ),

            ],
          )

    );
  }
}
