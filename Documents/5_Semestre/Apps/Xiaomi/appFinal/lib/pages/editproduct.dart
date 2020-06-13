import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gradient_app_bar/gradient_app_bar.dart';

class EditProduct extends StatefulWidget {
  final List list;
  final int index;

  EditProduct({this.index, this.list});

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  //para la base
  var _validation = GlobalKey<FormState>();
  TextEditingController controllerNombre;
  TextEditingController controllerPrecio;
  TextEditingController controllerDescripcion;
  TextEditingController controllerCategoria;

  void editProduct() {
    var url = "http://192.168.2.102/tienda/editProduct.php";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "nombre": controllerNombre.text,
      "precio": controllerPrecio.text,
      "descripcion": controllerDescripcion.text,
      "id_catg_producto": controllerCategoria.text
    });
  }

  @override
  void initState() {
    controllerNombre =
        new TextEditingController(text: widget.list[widget.index]['nombre']);
    controllerPrecio =
        new TextEditingController(text: widget.list[widget.index]['precio']);
    controllerDescripcion = new TextEditingController(
        text: widget.list[widget.index]['descripcion']);
    controllerCategoria = new TextEditingController(
        text: widget.list[widget.index]['id_catg_producto']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new GradientAppBar(
        gradient: LinearGradient(colors: [Colors.cyan, Colors.indigo]),
        title: new Text("EDITAR"),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.white, Colors.grey])),
        child: Form(
          key: _validation,
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new ListTile(
                    leading: const Icon(Icons.add_shopping_cart,
                        color: Colors.blueAccent),
                    title: new TextFormField(
                      controller: controllerNombre,
                      validator: (value) {
                        if (value.isEmpty)
                          return "Ingresa un nombre de Producto";
                      },
                      decoration: new InputDecoration(
                        hintText: "Producto",
                        labelText: "Producto",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.monetization_on,
                        color: Colors.blueAccent),
                    title: new TextFormField(
                      controller: controllerPrecio,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) return "Ingresa una precio";
                      },
                      decoration: new InputDecoration(
                        hintText: "Precio",
                        labelText: "precio",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading:
                        const Icon(Icons.description, color: Colors.blueAccent),
                    title: new TextFormField(
                      controller: controllerDescripcion,
                      validator: (value) {
                        if (value.isEmpty) return "Ingresa una descripcion";
                      },
                      decoration: new InputDecoration(
                        hintText: "Descripcion",
                        labelText: "Descripcion",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading:
                        const Icon(Icons.category, color: Colors.blueAccent),
                    title: new TextFormField(
                      controller: controllerCategoria,
                      validator: (value) {
                        if (value.isEmpty) return "Ingresa una Categoria";
                      },
                      decoration: new InputDecoration(
                        hintText: "Categoria",
                        labelText: "Categoria",
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
                        if (_validation.currentState.validate()) {
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
                                    Text("Producto editado correctamente "),
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
                                      editProduct();

                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                              '/pages/listProduct',
                                              (Route<dynamic> route) => false);
                                    },
                                  )
                                ],
                              );
                            },
                          );
                        } else {
                          print("Error");
                        }
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
