import 'package:flutter/material.dart';
import './editdata.dart';
import 'package:http/http.dart' as http;
import 'package:gradient_app_bar/gradient_app_bar.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index, this.list});
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = "http://192.168.2.102/tienda/deleteData.php";
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
              "Esta seguro de eliminar '${widget.list[widget.index]['username']}'"),
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
            deleteData();

            Navigator.of(context).pushNamedAndRemoveUntil(
                '/pages/listUser', (Route<dynamic> route) => false);
          },
        )
      ],
    );

    showDialog(context: context, child: alertDialog, barrierDismissible: false);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new GradientAppBar(
        title: new Text("${widget.list[widget.index]['username']}"),
        gradient: LinearGradient(colors: [Colors.cyan, Colors.indigo]),
      ),
      body: new Container(
        height: 800,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.white, Colors.grey])),
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: new Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(19.0),
              side: new BorderSide(color: Colors.blueAccent, width: 2.0),
            ),
            child: new Center(
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                  ),
                  Text(
                    "USUARIO:",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                  new Text(
                    widget.list[widget.index]['username'],
                    style: new TextStyle(fontSize: 20.0),
                  ),
                  Divider(
                    color: Colors.black,
                    height: 30,
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                  ),
                  Text(
                    "TELEFONO USUARIO:",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                  new Text(
                    widget.list[widget.index]['telefono'],
                    style: new TextStyle(fontSize: 20.0),
                  ),
                  Divider(
                    color: Colors.black,
                    height: 30,
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                  ),
                  Text(
                    "CIUDAD USUARIO:",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                  new Text(
                    widget.list[widget.index]['ciudad'],
                    style: new TextStyle(fontSize: 20.0),
                  ),
                  Divider(
                    color: Colors.black,
                    height: 30,
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                  ),
                  Text(
                    "DIRECCION USUARIO:",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                  new Text(
                    widget.list[widget.index]['direccion'],
                    style: new TextStyle(fontSize: 20.0),
                  ),
                  Divider(
                    color: Colors.black,
                    height: 30,
                  ),
                  new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        height: 40.0,
                        child: RaisedButton(
                          onPressed: () =>
                              Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new EditData(
                              list: widget.list,
                              index: widget.index,
                            ),
                          )),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.lightBlue, Colors.deepOrange],
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
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                      VerticalDivider(),
                      Container(
                        height: 40.0,
                        child: RaisedButton(
                          onPressed: () => confirm(),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.lightBlue, Colors.deepOrange],
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
                                style: TextStyle(color: Colors.black),
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
                                '/pages/listUser',
                                (Route<dynamic> route) => false);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.lightBlue, Colors.deepOrange],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomLeft,
                                ),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 85.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Regresar",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Divider(
                        color: Colors.white,
                        height: 50,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
