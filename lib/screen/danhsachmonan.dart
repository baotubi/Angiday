import 'package:flutter/material.dart';
import 'package:food_management/model/danhsach-controller.dart';
import 'package:food_management/screen/chitietmonan.dart';
// import 'package:food_management/screen/test_chitietmonan.dart';
import 'package:http/http.dart' as http;

class MonAnList extends StatelessWidget {
  final List<MonAn> monans;
  MonAnList({Key key, this.monans}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
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
                  child: Image.asset(
                      'images/${monans[index].hinh_mon_an["hinh_mon_an"].toString()}',
                      fit: BoxFit.cover),
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
                                          color:
                                              Theme.of(context).dividerColor)),
                                ),
                                alignment: AlignmentDirectional.bottomCenter,
                                padding: EdgeInsets.all(10),
                                child: Container(
                                    width: 180,
                                    child: Text(
                                      monans[index].ten_mon_an,
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
                                  child: Icon(
                                    Icons.bookmark_border,
                                    color: Color(0xffadadad),
                                    size: 28,
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text(monans[index].mo_ta),
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChiTietMonAn(
                        idMonAn: monans[index].id_mon_an,
                      )),
            );
          },
        );
      },
      itemCount: monans.length,
    );
  }
}

class DanhSachMonAn extends StatefulWidget {
  @override
  _DanhSachMonAnState createState() => _DanhSachMonAnState();
}

class _DanhSachMonAnState extends State<DanhSachMonAn> {
  @override
  initState() {
    super.initState();
    // Add listeners to this class
  }

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
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ChiTietMonAn()),
                  // );
                },
              ),
            ],
          ),
          //body
          body: FutureBuilder(
            future: fetchMonAns(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
              return snapshot.hasData
                  ? MonAnList(monans: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            },
          )),
    );
  }
}
