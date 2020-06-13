import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apptienda/pages/editCategory.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class DetailCategory extends StatefulWidget {
  List listCatg;
  int indexCatg;
  DetailCategory({this.listCatg, this.indexCatg});

  @override
  _DetailCategoryState createState() => new _DetailCategoryState();
}

class _DetailCategoryState extends State<DetailCategory> {
  void deletedcat() async {
    final categoriauso = await http.post(
        "http://192.168.2.102/tienda/deleteCategory.php",
        body: {'id': widget.listCatg[widget.indexCatg]['id']});

    var categoriaenuso = json.decode(categoriauso.body);
    if (categoriaenuso.length == 0) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                      "Esta seguro de eliminar '${widget.listCatg[widget.indexCatg]['nombre']}'"),
                  Divider(
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 50.0,
                  )
                ],
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text("Aceptar"),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/pages/listCategory', (Route<dynamic> route) => false);
                  },
                )
              ],
            );
          });
    } else {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "No puedes eliminar esta categoria ",
                  textAlign: TextAlign.center,
                ),
                Divider(color: Colors.white),
                Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 50.0,
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Aceptar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new GradientAppBar(
        title: new Text(
            "Categoria - ${widget.listCatg[widget.indexCatg]['nombre']}"),
        gradient: LinearGradient(colors: [Colors.cyan, Colors.indigo]),
        actions: <Widget>[],
      ),
      body: Container(
        height: 800,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.white, Colors.grey])),
        child: SingleChildScrollView(
          child: new Container(
            padding: const EdgeInsets.all(20.0),
            child: new Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19.0),
                side: new BorderSide(color: Colors.blueAccent, width: 2.0),
              ),
              child: new Center(
                child: new Column(
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                    ),
                    new Text(
                      widget.listCatg[widget.indexCatg]['nombre'],
                      style: new TextStyle(fontSize: 20.0),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                    ),
                    new Divider(
                      color: Colors.black,
                    ),
                    new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          height: 40.0,
                          child: RaisedButton(
                            onPressed: () => Navigator.of(context)
                                .push(new MaterialPageRoute(
                              builder: (BuildContext context) => new EditCateg(
                                listCatg: widget.listCatg,
                                indexCatg: widget.indexCatg,
                              ),
                            )),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.cyan,
                                      Colors.indigo
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomLeft,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: 85.0, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Editar",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        VerticalDivider(),
                        Container(
                          height: 40.0,
                          child: RaisedButton(
                            onPressed: () {
                              deletedcat();
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.indigo,
                                      Colors.cyan
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomLeft,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: 85.0, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Eliminar",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        VerticalDivider(),
                        Container(
                          height: 40.0,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/pages/listCategory',
                                  (Route<dynamic> route) => false);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.cyan,
                                      Colors.indigo
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomLeft,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: 85.0, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Salir",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Divider(
                              height: 80,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
