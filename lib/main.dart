// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:ffi';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<Padding> anlist = [];
  int rr = 0;

  List<String> qu = [
    "عدد الكواكب في المجموعه الشمسيه هو ثمانية كواكب ",
    "القطط هي حيوانات لاحمه ",
    "الصين موجوده في القاره الافريقيه ",
    "الارض مسطحة وليست كرويه"
  ];
  List<String> imag = [
    "asset/image-1.jpg",
    "asset/image-2.jpg",
    "asset/image-3.jpg",
    "asset/image-4.jpg"
  ];
  List<bool> aee = [true, true, false, false];

  int coun = 0;
  void checkAnswer(bool what) {
    bool corr = aee[coun];
    setState(() {
      if (what == corr) {
        rr++;
        anlist.add(Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_up,
            color: Colors.green,
          ),
        ));
      } else {
        anlist.add(Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_down,
            color: Colors.red,
          ),
        ));
      }
      if (h() == true) {
        Alert(
          context: context,
          type: AlertType.error,
          title: "انتهاء الاختبار",
          desc: "  لقد اجبت على$rrاسئله صحيحه 7",
          buttons: [
            DialogButton(
              child: Text(
                "ابدا من جديد",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        rws();
        anlist = [];
        rr = 0;
      } else {
        next();
      }
    });
  }

  void next() {
    if (coun < qu.length - 1) {
      coun++;
    }
  }

  bool h() {
    if (coun >= qu.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void rws() {
    coun = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("اختبار"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(children: anlist),
            Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Image.asset(imag[coun]),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      qu[coun],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24),
                    )
                  ],
                )),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                        onTap: () {
                          checkAnswer(true);
                        },
                        child: Container(
                            height: 100,
                            width: 90,
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(2)),
                            child: Text(
                              "صج",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ))))),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                        onTap: () {
                          checkAnswer(false);
                        },
                        child: Container(
                            height: 100,
                            width: 90,
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(2)),
                            child: Text(
                              "خطا",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            )))))
          ],
        ),
      ),
    );
  }
}
