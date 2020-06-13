import 'package:apptienda/allproduct/ListProduct.dart';
import 'package:apptienda/allproduct/detalles.dart';
import 'package:apptienda/pages/createCategory.dart';
import 'package:apptienda/pages/listCategory.dart';
import 'package:apptienda/pages/viewProduct.dart';
import 'package:flutter/material.dart';
import 'package:apptienda/pages/createAccount.dart';
import 'package:apptienda/pages/createProduct.dart';
import 'package:apptienda/pages/listProduct.dart';
import 'package:apptienda/pages/listUser.dart';
import 'package:apptienda/pages/pageUser.dart';
import 'package:apptienda/pages/pageAdmin.dart';
import 'package:apptienda/pages/login.dart';


void main() => runApp(LoginApp());

String username;

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mercado Libre',
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/pageAdmin': (BuildContext context) => new Admin(),
        '/pageUser': (BuildContext context) => new User(),
        '/pages/listProduct': (BuildContext context) => new ListProduct(),
        '/pages/login': (BuildContext context) => new LoginPage(),
        '/pages/listUser': (BuildContext context) => new ListUser(),
        '/pages/createAccount': (BuildContext context) => new AddData(),
        '/pages/createProduct': (BuildContext context) => new AddProduct(),
        '/pages/createCategory': (BuildContext context) => new AddCategory(),
        '/pages/viewProduct': (BuildContext context) => new ViewProduct(),
        '/pages/listCategory': (BuildContext context) => new LisCatg(),
           '/allproduct/ListProduct':(BuildContext context) => new Listado(),
           '/allproduct/detalles':(BuildContext context) => new SecondScreen(),


      },
    );
  }
}
