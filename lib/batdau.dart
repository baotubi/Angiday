import 'package:flutter/material.dart';

class BatDau extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        // SizedBox(width: MediaQuery.of(context).size.width/3),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            "images/img_cover1.jpg",
          ),
          fit: BoxFit.cover,
        )),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 60),
                decoration:
                    BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.6)),
                // width: MediaQuery.of(context).size.width/3,
                width: 360,
                height: 360,
                child: Column(
                  children: <Widget>[
                    //Container chứa logo
                    Container(
                      width: 360,
                      child: Image.asset(
                        'images/logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    //Container chứa mô tả
                    Container(
                        margin: EdgeInsets.only(top: 30),
                        width: 290,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '✓ Quản lý thực phẩm thô',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text('✓ Gợi ý món ăn ngon hàng ngày',
                                style: TextStyle(fontSize: 18)),
                            Text('✓ Hướng dẫn chế biến món ăn',
                                style: TextStyle(fontSize: 18)),
                            Text('✓ Theo dõi sức khỏe người dùng',
                                style: TextStyle(fontSize: 18)),
                          ],
                        )
                        //      RichText(
                        //   text: TextSpan(
                        //     children: <TextSpan>[
                        //       new TextSpan(text: 'Quản lý thực phẩm thô',),
                        //       new TextSpan(text: 'Gợi ý món ăn ngon hàng ngày'),
                        //       new TextSpan(text: 'Hướng dẫn chế biến món ăn'),
                        //       new TextSpan(text: 'Theo dõi sức khỏe người dùng'),
                        //     ],
                        //   ),
                        // )
                        )
                  ],
                )),
            Container(
              margin: EdgeInsets.only(top: 25),
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Color(0xffFFBD24),
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'Bắt đầu',
                  style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

