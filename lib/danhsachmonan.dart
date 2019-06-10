import 'package:flutter/material.dart';

class DanhSach extends StatefulWidget {
  @override
  _DanhSachState createState() => _DanhSachState();
}

class _DanhSachState extends State<DanhSach> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //app bar
        appBar: AppBar(
          backgroundColor: Color(0xffFFBD24),
          automaticallyImplyLeading: false,
          leading: Icon(Icons.menu),
          title: Text(
            'Món ăn cho bạn',
            style: TextStyle(fontSize: 22),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        //body
        body: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Theme.of(context).dividerColor)),
              ),
              child: Row(
                children: <Widget>[
                  //Hinh mon an
                  Container(
                    // decoration: BoxDecoration(
                    //   border: Border.all(width: 1.0, color: Colors.black),
                    // ),
                    child: Image.asset('images/1.jpg', fit: BoxFit.cover),
                    width: 120,
                    height: 150,
                    padding: EdgeInsets.all(5.0),
                  ),
                  // Thong tin mon an
                  Container(
                      width: 240,
                      // decoration: BoxDecoration(
                      //   border: Border.all(width: 1.0, color: Colors.black),
                      // ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            // decoration: BoxDecoration(
                            //   border:
                            //       Border.all(width: 1.0, color: Colors.black),
                            // ),
                            // decoration: BoxDecoration(
                            //   border: Border(
                            //       bottom: BorderSide(
                            //           color: Theme.of(context).dividerColor)),
                            // ),
                            alignment: AlignmentDirectional.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  // decoration: BoxDecoration(
                                  //   border: Border.all(
                                  //       width: 1.0, color: Colors.black),
                                  // ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Theme.of(context)
                                                .dividerColor)),
                                  ),
                                  alignment: AlignmentDirectional.bottomCenter,
                                  padding: EdgeInsets.all(10),
                                  child: Container(
                                      width: 185,
                                      child: Text(
                                        'Bún đậu mắm tôm',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      )),
                                ),
                                Container(
                                  // decoration: BoxDecoration(
                                  //   border: Border.all(
                                  //       width: 1.0, color: Colors.black),
                                  // ),
                                  padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                                  child: Image.asset(
                                    'images/bookmark-white.png',
                                    height: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text(
                                'Chi tiết món ăn Chi tiết món ăn Chi tiết món ăn Chi tiết món ăn Chi tiết món ăn'),
                          ),
                        ],
                      )),
                  // Container(
                  //   alignment: Alignment.topRight,
                  //   child: Image.asset('images/bookmark-white.png',
                  //   height: 30,),
                  // ),
                ],
              ),
              height: 150,
            ),
          ],
        ),
      ),
      
    );
  }
}