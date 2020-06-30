import 'package:covid_app/model/general.dart';
import 'package:covid_app/view/main_page.dart';
import 'package:flutter/material.dart';

Widget listview(context) {
  return ListView.builder(
    padding: EdgeInsets.all(0),
    itemCount: apiProvinsi.length,
    itemBuilder: (context, v) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: <Widget>[
              Text(apiProvinsi[v].atribut.namaprovinsi),
              Row(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Text(
                      apiProvinsi[v].atribut.kasusPosi.toString(),
                      style: TextStyle(
                          color: HexColor("#c7243a"),
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Text(
                      apiProvinsi[v].atribut.kasusSemb.toString(),
                      style: TextStyle(
                          color: HexColor("#438a5e"),
                          fontWeight: FontWeight.bold),
                    )),
                Text(
                  apiProvinsi[v].atribut.kasusMeni.toString(),
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                )
              ], mainAxisAlignment: MainAxisAlignment.end),
            ],
          ),
        ),
      );
    },
  );
}
