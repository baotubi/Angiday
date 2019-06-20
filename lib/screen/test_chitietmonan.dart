import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_management/model/chitiet-controller.dart';
import 'package:food_management/screen/danhsachmonan.dart';
import 'package:http/http.dart' as http;

class ChiTietMonAnList extends StatelessWidget {
  final List<MonAnChiTiet> chitiet;
  ChiTietMonAnList({Key key, this.chitiet}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SingleChildScrollView(
                  child: Center(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                              'images/${chitiet[index].hinh_mon_an["hinh_mon_an"]}'),

                          // Tên món ăn
                          Container(
                            margin: EdgeInsets.all(10),
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              chitiet[index].ten_mon_an,
                              style: TextStyle(fontSize: 24),
                            ),
                          ),

                          // Mô tả
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Theme.of(context).dividerColor)),
                            ),
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              chitiet[index].mo_ta,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),

                          // label Nguyên liệu
                          Container(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(left: 20, top: 10),
                                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                                decoration: BoxDecoration(
                                    color: Color(0xffFFBD24),
                                    borderRadius: BorderRadius.circular(25)),
                                child: Text(
                                  'Nguyên liệu',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 21,
                                      fontStyle: FontStyle.italic),
                                ),
                              )),

                          // Nguyên liệu chi tiết
                          Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Color(0xffadadad)),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              chitiet[index]
                                  .nguyen_lieu["nguyen_lieu"]
                                  .toString(),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),

                          // label Thực hiện
                          Container(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 20, top: 10),
                              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                              decoration: BoxDecoration(
                                  color: Color(0xffFFBD24),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Text(
                                'Thực hiện',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),

                          // Các bước thực hiện
                          Container(
                            padding: EdgeInsets.all(10),
                            child: ListView(
                              padding: EdgeInsets.all(0),
                              shrinkWrap: true,
                              children: <Widget>[
                                //Container chứa 1 bước
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: Color(0xffadadad)),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: ListTile(
                                    leading: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.black54,
                                          border: Border.all(
                                              color: Color(0xffadadad)),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Text(
                                        'Bước 1',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    title: Text(chitiet[index]
                                        .thuc_hien["thuc_hien"]
                                        .toString()),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          onTap: () {},
        );
      },
      itemCount: chitiet.length,
    );
  }
}

class ChiTietMonAn extends StatefulWidget {
  final String idMonAn;
  ChiTietMonAn({this.idMonAn}) : super();
  @override
  _ChiTietMonAnState createState() => _ChiTietMonAnState();
}

class _ChiTietMonAnState extends State<ChiTietMonAn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DanhSachMonAn()),
              );
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.chat_bubble_outline),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.bookmark_border),
              onPressed: () {},
            ),
          ],
        ),
        body: FutureBuilder(
          future: fetchChiTietMonAn(http.Client(), widget.idMonAn),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            return snapshot.hasData
                ? ChiTietMonAnList(chitiet: snapshot.data)
                : Center(child: CircularProgressIndicator());
          },
        )
        // SingleChildScrollView(
        //   child: Center(
        //     child: Container(
        //       child: Column(
        //         children: <Widget>[
        //           Image.asset('images/1.jpg'),

        //           // Tên món ăn
        //           Container(
        //             margin: EdgeInsets.all(10),
        //             alignment: AlignmentDirectional.topStart,
        //             child: Text(
        //               'Bún đậu mắm tôm siêu cay siêu to khổng lồ',
        //               style: TextStyle(fontSize: 24),
        //             ),
        //           ),

        //           // Mô tả
        //           Container(
        //             decoration: BoxDecoration(
        //               border: Border(
        //                   bottom: BorderSide(
        //                       color: Theme.of(context).dividerColor)),
        //             ),
        //             padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
        //             alignment: AlignmentDirectional.topStart,
        //             child: Text(
        //               'Bún đậu mắm tôm Bún đậu mắm tôm Bún đậu mắm tôm Bún đậu mắm tôm ',
        //               style: TextStyle(fontSize: 15),
        //             ),
        //           ),

        //           // label Nguyên liệu
        //           Container(
        //               alignment: Alignment.topLeft,
        //               child: Container(
        //                 margin: EdgeInsets.only(left: 20, top: 10),
        //                 padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        //                 decoration: BoxDecoration(
        //                     color: Color(0xffFFBD24),
        //                     borderRadius: BorderRadius.circular(25)),
        //                 child: Text(
        //                   'Nguyên liệu',
        //                   style: TextStyle(
        //                       color: Colors.white,
        //                       fontSize: 21,
        //                       fontStyle: FontStyle.italic),
        //                 ),
        //               )),

        //           // Nguyên liệu chi tiết
        //           Container(
        //             margin: EdgeInsets.all(10),
        //             padding: EdgeInsets.all(10),
        //             decoration: BoxDecoration(
        //                 color: Colors.white,
        //                 border: Border.all(color: Color(0xffadadad)),
        //                 borderRadius: BorderRadius.circular(5)),
        //             child: Text(
        //               'data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data ',
        //               style: TextStyle(fontSize: 15),
        //             ),
        //           ),

        //           // label Thực hiện
        //           Container(
        //             alignment: Alignment.topLeft,
        //             child: Container(
        //               margin: EdgeInsets.only(left: 20, top: 10),
        //               padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        //               decoration: BoxDecoration(
        //                   color: Color(0xffFFBD24),
        //                   borderRadius: BorderRadius.circular(25)),
        //               child: Text(
        //                 'Thực hiện',
        //                 style: TextStyle(
        //                     color: Colors.white,
        //                     fontSize: 21,
        //                     fontStyle: FontStyle.italic),
        //               ),
        //             ),
        //           ),

        //           // Các bước thực hiện
        //           Container(
        //             padding: EdgeInsets.all(10),
        //             child: ListView(
        //               padding: EdgeInsets.all(0),
        //               shrinkWrap: true,
        //               children: <Widget>[
        //                 //Container chứa 1 bước
        //                 Container(
        //                   margin: EdgeInsets.only(bottom: 10),
        //                   decoration: BoxDecoration(
        //                       color: Colors.white,
        //                       border: Border.all(color: Color(0xffadadad)),
        //                       borderRadius: BorderRadius.circular(5)),
        //                   child: ListTile(
        //                     leading: Container(
        //                       padding: EdgeInsets.all(5),
        //                       decoration: BoxDecoration(
        //                           color: Colors.black54,
        //                           border: Border.all(color: Color(0xffadadad)),
        //                           borderRadius: BorderRadius.circular(5)),
        //                       child: Text(
        //                         'Bước 1',
        //                         style: TextStyle(
        //                           color: Colors.white,
        //                         ),
        //                       ),
        //                     ),
        //                     title:
        //                         Text('Reloaded 2 of 446 libraries in 926ms.'),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // )
        );
  }
}
