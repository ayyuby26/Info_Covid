import 'package:covid_app/model/general.dart';
import 'package:covid_app/view/listview.dart';
import 'package:covid_app/viewmodels/indonesia.dart';
import 'package:covid_app/viewmodels/provinsi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var api, apiProvinsi;
var date = DateTime.now();
String hari = 'hari', bulan = 'bulan';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    translateDate();
    fetchdataAPI(context).then((value) {
      api = value;
      setState(() {});
    });
    fetchdataAPIProvinsi(context).then((value) {
      apiProvinsi = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(1, 254, 255, 255),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Info Covid di Indonesia',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        hari +
                            ', ' +
                            DateFormat('d').format(date).toString() +
                            ' ' +
                            bulan +
                            ' ' +
                            DateFormat('yyyy').format(date).toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 10,
                  child: Card(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    color: HexColor("#c7243a"),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Positif",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          api == null
                              ? CupertinoActivityIndicator()
                              : Text(api[0].positif,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 10,
                  child: Card(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    color: HexColor("#438a5e"),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Sembuh",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          api == null
                              ? CupertinoActivityIndicator()
                              : Text(api[0].sembuh,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 2 - 10,
                child: Card(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  color: HexColor("#f6d743"),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Dirawat",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        api == null
                            ? CupertinoActivityIndicator()
                            : Text(api[0].dirawat,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                )),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2 - 10,
                child: Card(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  color: Colors.black54,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Meninggal",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        api == null
                            ? CupertinoActivityIndicator()
                            : Text(api[0].meninggal,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
            SizedBox(height: 30),
            Text(
              "Info Covid perprovinsi",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
                margin:
                    EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
                height: MediaQuery.of(context).size.height - 425,
                padding: EdgeInsets.all(0),
                child: apiProvinsi == null
                    ? Center(
                        child: CupertinoActivityIndicator(radius: 20),
                      )
                    : listview(context)),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Data from kawalcorona.com, App By Ayyuby",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: HexColor("#aaaaaa")),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
