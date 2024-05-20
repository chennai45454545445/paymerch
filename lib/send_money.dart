import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:paymerch/pay_screen.dart';


class SendMoney extends StatefulWidget {
  const SendMoney( this.data,{super.key});
  final String data;

  @override
  State<SendMoney> createState() => _State();
}
void _navigateToNextScreen1(BuildContext context, List myList) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PayScreen(myList)));
}

List myList = [
  {
    "image": "image/avatar1.png",
    "name": "John Doe",
    "id": "\$Joh#236",
    "mobile": "8745987858",
    "transaction": "987654",
  },
  {
    "image": "image/avatar2.png",
    "name": "Nak Kake",
    "id": "\$Alan#225",
    "mobile": "9858746895",
    "transaction": "688744",
  },
  {
    "image": "image/avatar3.png",
    "name": "David Sam",
    "id": "\$Dav#265",
    "mobile": "8765325498",
    "transaction": "785496",
  },
  {
    "image": "image/avatar4.png",
    "name": "Nick Furry",
    "id": "\$Nic#268",
    "mobile": "8758699874",
    "transaction": "659874",
  }
];

class _State extends State<SendMoney> {

  List<Map<String, String>> RecentlyPaid = [
    {
      "image": "image/avatar1.png",
      "name": "John Doe",
      "badge": "image/greenstar.png"
    },
    {
      "image": "image/avatar2.png",
      "name": "Nak Kake",
      "badge": "image/redstar.png"
    },
    {
      "image": "image/avatar3.png",
      "name": "David Sam",
      "badge": "image/greenstar.png"
    },
    {
      "image": "image/avatar4.png",
      "name": "Nick Furry",
      "badge": "image/redstar.png"
    }
  ];
  TextEditingController mySearch = TextEditingController();
  List<Map<String, String>> filteredList = [];
  void filterResult (String searchText) async {
    if(filteredList.isNotEmpty) {
      filteredList = RecentlyPaid.where((item) =>
          item['name']!.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
      setState(() {});
    }else {
      filteredList = RecentlyPaid;
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filterResult(mySearch.text.toString());
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          margin: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                  child: Icon(Icons.arrow_back_ios_new_outlined)),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 25),
            child: Row(
              children: [
                Text(
                  widget.data,
                  style: TextStyle(fontFamily: "One", fontSize: 22),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 25, right: 25, top: 25),
            height: 45,
            child: TextField(
              controller: mySearch,
              onChanged: (value){
                  filterResult(value.toString());
              },
              style: TextStyle(color: Colors.grey),
              decoration: InputDecoration(
                hintText: "Search By PayTag, Number Or Name",
                hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                fillColor: Colors.white,
                filled: true,
                suffixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      width: 0.5,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: Colors.grey,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      width: 0.5,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: Colors.grey,
                    )),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 25, top: 22),
            child: Row(
              children: [
                Text(
                  "Recently Paid",
                  style: TextStyle(fontFamily: "One", fontSize: 15),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            height: 170,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 0.2,
                              color: Colors.black,
                            )),
                        child: Container(
                          margin: EdgeInsets.only(left: 5, top: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                filteredList[index]["badge"].toString(),
                                width: 20,
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(filteredList[index]["image"].toString(),),
                                    Text(
                                      filteredList[index]["name"].toString(),
                                      style: TextStyle(
                                          fontFamily: "One",
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 25, top: 20),
            child: Row(
              children: [
                Text(
                  "All From Your Contact",
                  style: TextStyle(fontFamily: "One", fontSize: 15),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: myList.length,
                itemBuilder: (context, index) {
                  return InkWell(onTap: (){
                    // _navigateToNextScreen1(context, myList[index]);
                    // print("myList[index] : ${myList[index]}");
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PayScreen(myList[index])));
                  },
                    child: Container(
                      margin: EdgeInsets.only(left: 25, top: 25),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                myList[index]["image"].toString(),
                                width: 45,
                                height: 45,
                              ),
                              Container(
                                width: 200,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                margin: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      myList[index]["name"].toString(),
                                      style: TextStyle(
                                          fontFamily: "Three",
                                          color: Colors.grey),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 49),
                                      child: Row(
                                        children: [
                                          Text(
                                            myList[index]["mobile"].toString(),
                                            style: TextStyle(
                                                fontFamily: "Three",
                                                color: Colors.grey,
                                                fontSize: 12),
                                          ),
                                          Spacer(),
                                          Text(
                                            "|",
                                            style: TextStyle(
                                                fontFamily: "Three",
                                                color: Colors.grey,
                                                fontSize: 12),
                                          ),
                                          Spacer(),
                                          Text(
                                            myList[index]["id"].toString(),
                                            style: TextStyle(
                                                fontFamily: "Three",
                                                color: Colors.grey,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                  margin: EdgeInsets.only(right: 20),
                                  child: Image.asset(
                                    'image/greenstar.png',
                                    width: 26,
                                    height: 26,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
