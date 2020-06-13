import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gradient_app_bar/gradient_app_bar.dart';

class EditCateg extends StatefulWidget {
  final List listCatg;
  final int indexCatg;

  EditCateg({this.indexCatg, this.listCatg});

  @override
  _EditCategState createState() => _EditCategState();
}

class _EditCategState extends State<EditCateg> {
  final titulo = TextStyle(color: Colors.black, fontSize: 15.0);
  var _validacion = GlobalKey<FormState>();
  TextEditingController controllerNombreCateg;

  void editCateg() {
    var url = "http://192.168.2.102/tienda/editCategory.php";
    http.post(url, body: {
      "id": widget.listCatg[widget.indexCatg]['id'],
      "nombre": controllerNombreCateg.text,
    });
  }

  @override
  void initState() {
    controllerNombreCateg = new TextEditingController(
        text: widget.listCatg[widget.indexCatg]['nombre']);
    super.initState();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new GradientAppBar(
        gradient: LinearGradient(colors: [Colors.cyan, Colors.indigo]),
        title: new Text("EDITAR"),
        actions: <Widget>[],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.white, Colors.grey])),
        child: Form(
          key: _validacion,
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new ListTile(
                    leading: const Icon(Icons.rate_review, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerNombreCateg,
                      validator: (value) {
                        if (value.isEmpty) return "Ingresa una categoria";
                      },
                      decoration: new InputDecoration(
                        hintText: "Nombre categoria",
                        labelText: "Nombre categoria",
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1.0,
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  Container(
                    height: 40.0,
                    child: RaisedButton(
                      onPressed: () {
                        if (_validacion.currentState.validate()) {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        "Categoria editada correctamente ",
                                        textAlign: TextAlign.center,
                                      ),
                                      Divider(
                                        color: Colors.white,
                                      ),
                                      Icon(
                                        Icons.done,
                                        color: Colors.green,
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
                                        editCateg();
                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                                '/pages/listCategory',
                                                (Route<dynamic> route) =>
                                                    false);
                                      },
                                    ),
                                  ],
                                );
                              });
                        } else {
                          print('error al editar producto');
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.cyan, Colors.indigo],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomLeft,
                            ),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: Text(
                            "Guardar",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
