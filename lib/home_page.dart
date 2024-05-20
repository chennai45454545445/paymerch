import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paymerch/send_money.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _State();
}

void _navigateToNextScreen1(BuildContext context, String text) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => SendMoney(text)));
}

class _State extends State<HomePage> {
  String email="";
  void getMyData() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      email= sp.getString("email")!;
    });
  }
  int bottomnavigation = 0;
  List myList = [];
  bool showNoRecentTransaction = true;
  @override
  void initState() {
    super.initState();
     getMyData();
    // Simulate loading data after a delay
    Future.delayed(Duration(seconds: 1), () {
      print("CodeWorking");
      setState(() {
          myList.addAll([
            {
              "image": "image/avatar1.png",
              "name": "John Doe",
              "time": "8:23PM",
              "transactionid": "987654",
              "money": "-\$18"
            },
            {
              "image": "image/avatar2.png",
              "name": "Alan Jack",
              "time": "9:23PM",
              "transactionid": "854754",
              "money": "+\$20"
            },
            {
              "image": "image/avatar3.png",
              "name": "David Sam",
              "time": "8:20AM",
              "transactionid": "748535",
              "money": "-\$40"
            },
            {
              "image": "image/avatar4.png",
              "name": "Nick Furry",
              "time": "7:20AM",
              "transactionid": "658741",
              "money": "+\$5"
            }
          ]);
          Future.delayed(Duration(seconds: 2), (){
            setState(() {
              showNoRecentTransaction = false;
            });
          } );
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          margin: EdgeInsets.only(left: 20),
          height: 80,
          width: 80,
          child: Row(
            children: [
              Image.asset(
                'image/avatar4.png',
                height: 40,
                width: 40,
              ),
              Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    "Binod",
                    style: TextStyle(fontFamily: "One", fontSize: 18),
                  )),
            ],
          ),
        ),
        leadingWidth: 200,
        actions: [
          Container(
              margin: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.qr_code_scanner,
                size: 21,
              )),
          Container(
              margin: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.notifications_active_sharp,
                size: 21,
              )),
          Container(
              margin: EdgeInsets.only(right: 28),
              child: Icon(
                Icons.chat,
                size: 21,
              )),
        ],
      ),
      body: Stack(
        children: [
          if (bottomnavigation == 0)
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Button

                        ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              minimumSize: Size(180, 60),
                            ),
                            onPressed: () {
                              _navigateToNextScreen1(context, "Request Money");
                            },
                            icon: Image.asset(
                              'image/requestmoney.png',
                              color: Colors.white,
                              height: 30,
                              width: 30,
                            ),
                            label: Text(
                              "Request Money",
                              style: TextStyle(
                                  color: Colors.white, fontFamily: "One"),
                            )),
                        Spacer(),
                        //Button
                        ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              minimumSize: Size(180, 60),
                            ),
                            onPressed: () {
                              _navigateToNextScreen1(context, "Send Money");
                            },
                            icon: Image.asset(
                              'image/send.png',
                              color: Colors.white,
                              height: 30,
                              width: 30,
                            ),
                            label: Text(
                              "Send Money",
                              style: TextStyle(
                                  color: Colors.white, fontFamily: "One"),
                            )),
                      ],
                    ),
                  ),
                  // Text(email),
                  // Transaction Section
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    height: 280,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 250, 246, 246),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        // Recent Transaction
                        Container(
                          margin: EdgeInsets.only(left: 15, top: 15),
                          child: Row(
                            children: [
                              Text(
                                "Recent Transaction",
                                style:
                                    TextStyle(fontFamily: "One", fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        if (showNoRecentTransaction)
                        // Show "No Recent Transaction" text for 5 seconds
                        //   Container(
                        //     margin: EdgeInsets.only(top: 100),
                        //     child: Text(
                        //       "No Recent Transaction",
                        //       style: TextStyle(
                        //           fontFamily: "One", fontSize: 25),
                        //     ),
                        //   )
                          Container(
                            margin: EdgeInsets.only(top: 80),
                              child: CircularProgressIndicator(

                              ))
                        else
                        Expanded(
                          child: ListView.builder(
                            itemCount: myList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(
                                    top: 10, left: 10, right: 10),
                                height: 80,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromARGB(10, 10, 10, 10),
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        myList[index]["image"].toString(),
                                        width: 52,
                                        height: 52,
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 18, left: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 5),
                                                child: Text(
                                                  myList[index]["name"]
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontFamily: "One",
                                                      fontSize: 13),
                                                )),
                                            Row(
                                              children: [
                                                Text(
                                                    myList[index]["time"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontFamily: "Three",
                                                        fontSize: 12,
                                                        color: Colors.grey)),
                                                Text("  Trans Id: ",
                                                    style: TextStyle(
                                                        fontFamily: "Three",
                                                        fontSize: 12,
                                                        color: Colors.grey)),
                                                Text(
                                                    myList[index]
                                                            ["transactionid"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontFamily: "Three",
                                                        fontSize: 12,
                                                        color: Colors.grey)),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      // $18
                                      Container(
                                          margin: EdgeInsets.only(right: 10),
                                          height: 58,
                                          width: 58,
                                          decoration: BoxDecoration(
                                            color: (myList[index]["money"].toString().startsWith("+"))
                                                ? Color.fromARGB(
                                                255, 209, 239, 180)
                                                : Color.fromARGB(
                                                255, 255, 210, 210),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                myList[index]["money"].toString(),
                                                style: TextStyle(
                                                    fontFamily: "One",
                                                color: (myList[index]["money"].toString().startsWith("+"))? Colors.green: Colors.red,
                                                    fontSize: 19),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              "Show More +",
                              style: TextStyle(
                                  fontFamily: "one", color: Colors.grey),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 25, right: 25),
                    height: 145,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 250, 246, 246),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          child: Row(
                            children: [
                              Text(
                                "Bill & More",
                                style:
                                    TextStyle(fontFamily: "One", fontSize: 16),
                              ),
                              Spacer(),
                              Text(
                                "Show More",
                                style: TextStyle(
                                    fontFamily: "One",
                                    fontSize: 14,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        // Bill & More
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.water_drop,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "Water",
                                    style: TextStyle(
                                        fontFamily: "one", fontSize: 12),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.lightbulb,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "Electricity",
                                    style: TextStyle(
                                        fontFamily: "one", fontSize: 12),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.home,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "Rent",
                                    style: TextStyle(
                                        fontFamily: "one", fontSize: 12),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.phone_android,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "Phone",
                                    style: TextStyle(
                                        fontFamily: "one", fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 9, left: 25, right: 25),
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 250, 246, 246),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            height: 58,
                            width: 58,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 254, 254),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'image/gift.png',
                                  width: 45,
                                  height: 45,
                                ),
                              ],
                            )),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Text(
                                "Invited Friend To\n"
                                "Pay Merch",
                                style:
                                    TextStyle(fontFamily: "One", fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(255, 7, 136, 195),
                                  Color.fromARGB(255, 132, 220, 255),
                                ],
                              )),
                          child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: Size(30, 40),
                              ),
                              onPressed: () {},
                              icon: Image.asset(
                                'image/wtsp.png',
                                color: Colors.white,
                                width: 20,
                                height: 20,
                              ),
                              label: Text(
                                "Get \$5",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          else
            Container(
              child: Text(""),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedLabelStyle: TextStyle(fontSize: 15),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            bottomnavigation = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 20,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.money,
                size: 20,
              ),
              label: "Unity"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.qr_code_scanner,
                size: 20,
              ),
              label: "My Code"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
                size: 20,
              ),
              label: "History"),
        ],
      ),
    );
  }
}
