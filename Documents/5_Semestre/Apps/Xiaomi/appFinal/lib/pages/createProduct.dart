import 'dart:io';
import 'package:async/async.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:gradient_app_bar/gradient_app_bar.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  File _image;
  var _formKey = GlobalKey<FormState>();
  TextEditingController nombreimg = new TextEditingController();
  TextEditingController controllerNombre = new TextEditingController();
  TextEditingController controllerPrecio = new TextEditingController();
  TextEditingController controllerdescripcion = new TextEditingController();
  TextEditingController controllerCategoria = new TextEditingController();

  Future getImageGallery() async {
    var imgeFile = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 200.0, maxWidth: 200.0);

    setState(() {
      _image = imgeFile;
    });
  }

  Future getImageCamera() async {
    var imgeFile = await ImagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 200.0, maxWidth: 200.0);
    setState(() {
      _image = imgeFile;
    });
  }

  Future upload(File imgeFile) async {
    var stream =
        new http.ByteStream(DelegatingStream.typed(imgeFile.openRead()));
    var length = await imgeFile.length();
    var uri = Uri.parse("http://192.168.2.102/tienda/image.php");

    var request = new http.MultipartRequest("POST", uri);

    var multipartFile = new http.MultipartFile("image", stream, length,
        filename: basename(imgeFile.path));

    request.fields['nombre'] = controllerNombre.text;
    request.fields['precio'] = controllerPrecio.text;
    request.fields['descripcion'] = controllerdescripcion.text;
    request.fields['id_catg_producto'] = controllerCategoria.text;
    request.files.add(multipartFile);

    var response = await request.send();
    if (response.statusCode == 200) {
      print("Image Uploaded");
    } else {
      print("Upload Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new GradientAppBar(
          gradient: LinearGradient(colors: [Colors.cyan, Colors.indigo]),
          title: new Text("Agregar Producto"),
          actions: <Widget>[],
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.white, Colors.grey])),
            child: Form(
                key: _formKey,
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView(children: <Widget>[
                      new Column(
                        children: <Widget>[
                          new ListTile(
                            leading: const Icon(Icons.rate_review,
                                color: Colors.blueAccent),
                            title: new TextFormField(
                              controller: controllerNombre,
                              validator: (value) {
                                if (value.isEmpty)
                                  return " Ingrese el nombre del producto ";
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
                              validator: (value) {
                                if (value.isEmpty) return "Ingresa un precio";
                              },
                              decoration: new InputDecoration(
                                hintText: "Precio",
                                labelText: "Precio",
                              ),
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                            ),
                          ),
                          new ListTile(
                            leading: const Icon(Icons.description,
                                color: Colors.blueAccent),
                            title: new TextFormField(
                              controller: controllerdescripcion,
                              validator: (value) {
                                if (value.isEmpty)
                                  return "Ingrese una descricion de su producto";
                              },
                              decoration: new InputDecoration(
                                hintText: "Descripcion",
                                labelText: "Descripcion",
                              ),
                            ),
                          ),
                          new ListTile(
                            leading: const Icon(Icons.category,
                                color: Colors.blueAccent),
                            title: new TextFormField(
                              controller: controllerCategoria,
                              validator: (value) {
                                if (value.isEmpty)
                                  return "Ingrese una categoria";
                              },
                              decoration: new InputDecoration(
                                hintText: "Categoria",
                                labelText: "Categoria",
                              ),
                            ),
                          ),
                          Divider(),
                          Center(
                            child: _image == null
                                ? new Text('Selecione una imagen')
                                : new Image.file(_image),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(75, 0, 10, 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                RaisedButton(
                                  child: Icon(
                                    Icons.image,
                                    color: Colors.blueAccent,
                                  ),
                                  onPressed: getImageGallery,
                                ),
                                VerticalDivider(),
                                RaisedButton(
                                  child: Icon(
                                    Icons.camera,
                                    color: Colors.blueAccent,
                                  ),
                                  onPressed: getImageCamera,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 40.0,
                            child: RaisedButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
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
                                              "Producto Guardado correctamente ",
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
                                              upload(_image);

                                              Navigator.of(context)
                                                  .pushNamedAndRemoveUntil(
                                                      '/allproduct/ListProduct',
                                                      (Route<dynamic> route) =>
                                                          false);
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
                                    "Guardar",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Divider(),
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
                                      colors: [Colors.cyan, Colors.indigo],
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
                      ),
                    ])))));
  }
}
