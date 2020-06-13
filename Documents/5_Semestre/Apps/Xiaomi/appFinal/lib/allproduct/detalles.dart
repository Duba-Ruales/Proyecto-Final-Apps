import 'package:flutter/material.dart';
import 'package:apptienda/allproduct/Clase.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class SecondScreen extends StatefulWidget {
  List listPrd;
  int indexProd;
  final Datos value;

  SecondScreen({Key key, this.value}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new GradientAppBar(
        title: new Text('DETALLES '),
        gradient: LinearGradient(colors: [Colors.cyan, Colors.indigo]),
      ),
      body: SingleChildScrollView(
        child: new Container(
          height: 1000,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.white, Colors.grey])),
          child: new Center(
            child: Column(
              children: <Widget>[
                Padding(
                  child: new Text(
                    'PRODUCTO',
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                  padding: EdgeInsets.only(bottom: 20.0),
                ),
                Padding(
                  child: Image.network('${widget.value.imgen}'),
                  padding: EdgeInsets.all(12.0),
                ),
                Padding(
                  child: new Text(
                    'Nombre : ${widget.value.nombre}',
                    style: new TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  padding: EdgeInsets.all(20.0),
                ),
                Padding(
                  child: new Text(
                    'Precio : \$ ${widget.value.precio}',
                    style: new TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  padding: EdgeInsets.all(20.0),
                ),
                Padding(
                  child: new Text(
                    'Descripcion : ${widget.value.descripcion}',
                    style: new TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  padding: EdgeInsets.all(20.0),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 40.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/allproduct/ListProduct',
                              (Route<dynamic> route) => false);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.indigo, Colors.cyan],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomLeft,
                              ),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 300.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Regresar",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
