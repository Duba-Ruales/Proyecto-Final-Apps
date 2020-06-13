import 'package:flutter/material.dart';
import 'package:apptienda/allproduct/Clase.dart';
import 'package:apptienda/allproduct/detalles.dart';

class CustomListView extends StatelessWidget {
  final List<Datos> dataproductos;

  CustomListView(this.dataproductos);

  Widget build(context) {
    return ListView.builder(
      itemCount: dataproductos.length,
      itemBuilder: (context, int currentIndex) {
        return createViewItem(dataproductos[currentIndex], context);
      },
    );
  }

  Widget createViewItem(Datos dataproduct, BuildContext context) {
    return new ListTile(
        title: new Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19.0),
            side: new BorderSide(color: Colors.blueAccent, width: 2.0),
          ),
          elevation: 5.0,
          child: new Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  child: Image.network(dataproduct.imgen),
                  padding: EdgeInsets.only(bottom: 8.0),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.0),
                    side: new BorderSide(color: Colors.black, width: 2.0),
                  ),
                  child: Wrap(children: <Widget>[
                    Text(
                      "  Nombre:",style: TextStyle(color: Colors.blueAccent),
                    ),
                   /*  Divider(
                      color: Colors.white,
                      height: 0,
                    ),  */
                    Text("  "),
                    Padding(
                        child: Text(
                          dataproduct.nombre,
                          style: new TextStyle(fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                        padding: EdgeInsets.all(3.0)),
                   
                  ]),
                ),
                new Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.0),
                    side: new BorderSide(color: Colors.black, width: 2.0),
                  ),
                  child: Wrap(
                    children: <Widget>[
                      Text("   Precio:",style: TextStyle(color: Colors.blueAccent),),
                      Divider(
                        color: Colors.white,
                        height: 1,
                      ),
                      Text("   \$"),
                      Padding(
                          child: Text(
                            
                            dataproduct.precio,
                            style: new TextStyle(fontWeight: FontWeight.w400),
                            textAlign: TextAlign.end,
                          ),
                          padding: EdgeInsets.all(1.0)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          var route = new MaterialPageRoute(
            builder: (BuildContext context) =>
                new SecondScreen(value: dataproduct),
          );

          Navigator.of(context).push(route);
        });
  }
}
