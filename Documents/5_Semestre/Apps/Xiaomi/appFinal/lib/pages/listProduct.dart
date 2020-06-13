import 'package:apptienda/pages/editproduct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apptienda/pages/createProduct.dart';
import 'package:apptienda/pages/detailproduct.dart';
import 'dart:async';
import 'dart:convert';

class ListProduct extends StatefulWidget {
  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  Future<List> getProduct() async {
    final response = await http.get(
      "http://192.168.2.102/tienda/getProduct.php",
    );
    return json.decode(response.body);
  }

  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      ListProduct();
      AddProduct();
      Detailproduct();
      EditProduct();
    });
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
           leading: Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.keyboard_backspace),

          onPressed: () {
                Navigator.pushReplacementNamed(context, '/pages/view_product');
            
              },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    },
  ),
        title: new Text("Listado de productos", textAlign: TextAlign.center),
        actions: <Widget>[
          IconButton(
              icon: Icon(
              
                Icons.keyboard_backspace,
                size: 40.0,
                color: Colors.yellowAccent,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/pages/viewProduct');
                
              })
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(
          Icons.add,
          color: Colors.redAccent,
        ),
        backgroundColor: Colors.greenAccent,
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new AddProduct(),
        )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        child: Material(
            child: SizedBox(
              width: double.infinity,
              height: 50.0,
            ),
            color: Colors.black),
      ),
      body: RefreshIndicator(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.red, Colors.white])),
          child: new FutureBuilder<List>(
            future: getProduct(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? new ItemList(
                      list: snapshot.data,
                    )
                  : new Center(
                      child: new CircularProgressIndicator(),
                    );
            },
          ),
        ),
        onRefresh: refreshList, //Refresh
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (BuildContext context) => new Detailproduct(
                        listPrd: list,
                        indexProd: i,
                      )),
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(
                  list[i]['nombre'],
                  style: TextStyle(fontSize: 25.0, color: Colors.black),
                ),
                leading: new Icon(
                  Icons.add_shopping_cart,
                  size: 50.0,
                  color: Colors.green,
                ),
                subtitle: new Text(
                  "Precio →  ${list[i]['precio']}",
                  /*  list[i]['precio'],  */
                  style: TextStyle(fontSize: 20.0, color: Colors.grey),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
