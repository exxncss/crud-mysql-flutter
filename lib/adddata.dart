import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'listdata.dart';
import 'dart:async';
import 'dart:convert';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerCode = new TextEditingController();
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerPrice = new TextEditingController();
  TextEditingController controllerStock = new TextEditingController();

  void addData() {
    var url = "http://10.0.2.2/my_store/adddata.php";

    http.post(url, body: {
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text
    });
  }

  void error(BuildContext context, String error) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(error),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ADD DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerCode,
                  decoration: new InputDecoration(
                      hintText: "Item Code", labelText: "Item Code"),
                ),
                new TextField(
                  controller: controllerName,
                  decoration: new InputDecoration(
                      hintText: "Item Name", labelText: "Item Name"),
                ),
                new TextField(
                  controller: controllerPrice,
                  decoration: new InputDecoration(
                      hintText: "Price", labelText: "Price"),
                ),
                new TextField(
                  controller: controllerStock,
                  decoration: new InputDecoration(
                      hintText: "Stock", labelText: "Stock"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  onPressed: () {
                    //Navigator.pop(context);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return Home();
                    }));
                    // Navigator.of(context).pushReplacement(new MaterialPageRoute(
                    //     builder: (BuildContext context) => new Home()));
                  },
                  child: new Text("Kembali"),
                  color: Colors.blueAccent,
                ),
                new RaisedButton(
                  onPressed: () {
                    if (controllerCode.value.text.isEmpty) {
                      setState(() {
                        error(context, "ID tidak boleh kosong");
                      }); //ID gabole kosong
                    } else if (controllerCode.value.text
                        .contains(RegExp(r'[a-zA-Z]'))) {
                      setState(() {
                        error(context, "ID harus angka");
                        error(context, "Isi data dengan benar!");
                      }); //id harus angka
                    } else if (controllerCode.value.text.length != 3) {
                      setState(() {
                        error(context, "ID harus berisi 3 angka");
                        error(context, "Isi data dengan benar!");
                      }); //id harus 3 angka
                    } else if (controllerName.value.text.isEmpty) {
                      setState(() {
                        error(context, "Nama item tidak boleh kosong");
                        error(context, "Isi data dengan benar!");
                      }); //nama ga bole kosong
                    } else if (controllerName.value.text.length < 5) {
                      error(context, "Nama item minimal harus 5 karakter");
                      error(context, "Isi data dengan benar!");
                      //nama gaboleh kurang dari 5
                    } else if (controllerPrice.value.text.isEmpty) {
                      setState(() {
                        error(context, "Harga tidak boleh kosong");
                        error(context, "Isi data dengan benar!");
                      }); //harga gabole kosong
                    } else if (controllerPrice.value.text
                        .contains(RegExp(r'[a-zA-Z]'))) {
                      setState(() {
                        error(context, "Isi hanya dengan angka");
                        error(context, "Isi data dengan benar!");
                      }); //harga harus angka
                    } else if (controllerPrice.value.text.length < 4) {
                      setState(() {
                        error(context, "Harga tidak sesuai format");
                        error(context, "Isi data dengan benar!");
                      }); //harga harus minimal 4 karakter
                    } else {
                      addData();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return Home();
                      }));
                    }

                    // Navigator.of(context).pushReplacement(new MaterialPageRoute(
                    //     builder: (BuildContext context) => new Home()));
                  },
                  child: new Text("Add Data"),
                  color: Colors.blueAccent,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
