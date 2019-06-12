import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChiTietMonAn extends StatefulWidget {
  @override
  _ChiTietMonAnState createState() => _ChiTietMonAnState();
}

class _ChiTietMonAnState extends State<ChiTietMonAn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: ,
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Image.asset('images/1.jpg'),

              // Tên món ăn
              Container(
                margin: EdgeInsets.all(10),
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'Bún đậu mắm tôm siêu cay siêu to khổng lồ',
                  style: TextStyle(fontSize: 24),
                ),
              ),

              // Mô tả
              Container(
                decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: Theme.of(context).dividerColor)),
                ),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'Bún đậu mắm tôm Bún đậu mắm tôm Bún đậu mắm tôm Bún đậu mắm tôm ',
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
                  'data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data ',
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
                          border: Border.all(color: Color(0xffadadad)),
                          borderRadius: BorderRadius.circular(5)),
                      child: ListTile(
                        leading: Container(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              border: Border.all(color: Color(0xffadadad)),
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        title: Text('Reloaded 2 of 446 libraries in 926ms. Reloaded 2 of 446 libraries in 926ms. Reloaded 2 of 446 libraries in 926ms. Reloaded 2 of 446 libraries in 926ms. Reloaded 2 of 446 libraries in 926ms.'),
                      ),
                    ),
                    
                    
                    
                    
                    Container(
                      margin: EdgeInsets.only(bottom: 10),  
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xffadadad)),
                          borderRadius: BorderRadius.circular(5)),
                      child: ListTile(
                        leading: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              border: Border.all(color: Color(0xffadadad)),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            'Bước 2',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        title: Text('Reloaded 2 of 446 libraries in 926ms.'),
                      ),
                    )
                  
                  
                  
                  
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
