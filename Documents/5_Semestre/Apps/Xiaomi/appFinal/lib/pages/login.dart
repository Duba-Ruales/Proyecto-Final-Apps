import 'package:apptienda/pages/createAccount.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();
  bool _obscureText = true;
  String mensaje = '';
  Future<List> login() async {
    final response =
        await http.post("http://192.168.2.102/tienda/login.php", body: {
      "username": controllerUser.text,
      "password": controllerPass.text,
    });

    //

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                title: Text("Datos erroneos"),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Ingrese Password/User Correctos"),
                    Icon(
                      Icons.error,
                      color: Colors.lightBlue[900],
                      size: 73.0,
                    )
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      "Aceptar",
                      style: TextStyle(color: Colors.lightBlue[900]),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      });
    } else {
      if (datauser[0]['estado'] == 'admin') {
       
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/pageAdmin', (Route<dynamic> route) => false);
      } else if (datauser[0]['estado'] == 'ventas') {
      
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/pages/viewProduct', (Route<dynamic> route) => false);
      }

      setState(() {
        username = datauser[0]['username'];
      });
    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: new Scaffold(
        resizeToAvoidBottomPadding: false,
       
        body: Container(
          child: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage("assets/images/digital12.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(top: 77.0),
                  child: new CircleAvatar(
                    backgroundColor: Colors.green[200],
                    child: new Image(
                      width: 135,
                      height: 135,
                      image: new AssetImage('assets/images/avatar7.png'),
                    ),
                  ),
                  width: 170.0,
                  height: 170.0,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 93),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        padding: EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.red, blurRadius: 5),
                            ]),
                        child: TextFormField(
                          controller: controllerUser,
                          decoration: InputDecoration(
                              icon: Icon(Icons.email,
                                  color: Colors.lightBlue[800]),
                              hintText: 'User'),
                        ),
                      ),
                      
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 50,
                        margin: EdgeInsets.only(top: 32),
                        padding: EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.red, blurRadius: 5),
                            ]),
                        child: TextFormField(
                          controller: controllerPass,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                              hintText: 'Contraseña',
                              icon: Icon(
                                Icons.security,
                                color: Colors.lightBlue[800],
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.lightBlue[800],
                                ),
                              )),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 40.0,
                        child: RaisedButton(
                          onPressed: () {
                            login();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff374ABE),
                                    Color(0xff64B6FF)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 150.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Ingresar",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    
                      Spacer(),
                      Container(
                        height: 40.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new AddData()));
                 
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.cyan, Colors.indigo],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 150.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Crear Cuenta",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        mensaje,
                        style: TextStyle(fontSize: 1, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
