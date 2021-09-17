// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quotes_app/screens/loginScreen/login_screen.dart';
// import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  final dataList;
  const HomePage({Key? key, this.dataList}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data = [];
  TextEditingController _quotesController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

  }

  submit() {
    var quotesListData = {
      "qName": _quotesController.text,
      "date": DateTime.now().toString().substring(0, 10)
    };

  // setState(() {
  //     data.add(quotesListData);
  // });
    print("fcgh" + data.toString());
     return quotesListData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          actions: [
            InkWell(
                onTap: () {
                  _showLogoutBottomModal(context);
                },
                child: Icon(Icons.add)),
            SizedBox(
              width: 15,
            ),
            InkWell(
              onTap: (){
                print("xdfcgvh");
                print(widget.dataList);
                // setState(() {
                //   widget.dataList.remove(widget.dataList);
                //   print(   widget.dataList.remove(widget.dataList));
                // });
Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
              child: Icon(Icons.logout)),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: data.length == 0
            ? Center(
              child: Container(
                color: Colors.red,
                  child: Text("no data"),
                ),
            )
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                      children: List.generate(data.length, (index) {
                    return Container(
                      height: 150,
                      margin: EdgeInsets.all(8),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.my_library_music,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text("Qoutes Name"),
                                        Text(data[index]["qName"]),
                                      ],
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: (){
                            setState(() {
                                      data.remove(data[index]);
                            });
                                  },
                                  child: Icon(
                                    Icons.delete,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text(data[index]["date"]),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  })),
                ),
              ));
  }

  void _showLogoutBottomModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => StatefulBuilder(
              builder: (context, StateSetter state) {
                return Wrap(
                  children: <Widget>[
                    Container(
                      height: 250,
                      padding: EdgeInsets.only(top: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Add a Quotes"),
                                InkWell(
                                    onTap: () => Navigator.of(context).pop(),
                                    child: Container(
                                        height: 50,
                                        width: 50,
                                        child: Icon(Icons.cancel))),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              controller: _quotesController,
                              decoration: InputDecoration(
                                labelText: 'Enter Your Quotes',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Cancel"),
                                SizedBox(
                                  width: 40,
                                ),
                                InkWell(
                                    onTap: () {
                                     
                                      setState(() {
                                        //  submit();
                                        data.add(submit());
                                      });
                                    },
                                    child: Text("Submit"))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ));
  }
}