import 'package:apptienda/pages/listUser.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new GradientAppBar(
        gradient: LinearGradient(colors: [Colors.cyan, Colors.indigo]),
        title: Text('Pagina Admin'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AboutWidget();
                }),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.white, Colors.grey])),
        child: new Column(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19.0),
                side: new BorderSide(color: Colors.blueAccent, width: 2.0),
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19.0),
                  side: new BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
                child: ListTile(
                  title: Text("Registro de Usuarios"),
                  subtitle: Text("Administrar"),
                  leading: Icon(
                    Icons.supervised_user_circle,
                    color: Colors.blueAccent,
                    size: 60.0,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                  onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil('/pages/listUser', (Route<dynamic> route) => false);
                  }
                ),
              ),
            ),

            /* Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19.0),
                side: new BorderSide(color: Colors.blueAccent, width: 2.0),
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19.0),
                  side: new BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
                child: ListTile(
                  title: Text("Registro de Productos"),
                  subtitle: Text("Administrar"),
                  leading: Icon(
                    Icons.shopping_cart,
                    color: Colors.blueAccent,
                    size: 60.0,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new ListProduct(),
                    ));
                   
                  },
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19.0),
                side: new BorderSide(color: Colors.blueAccent, width: 2.0),
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19.0),
                  side: new BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
                child: ListTile(
                  title: Text("Registro de Categorias"),
                  subtitle: Text("Administrar"),
                  leading: Icon(
                    Icons.shopping_cart,
                    color: Colors.blueAccent,
                    size: 60.0,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new LisCatg(),
                    ));
                   
                  },
                ),
              ),
            ), */
          ],
        ),
      ),
    );
  }
}

class AboutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        backgroundColor: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("¿Desea salir de la sesion? "),
            Icon(
              Icons.highlight_off,
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
              /* Navigator.pushReplacementNamed(context, '/pages/login'); */
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/pages/login', (Route<dynamic> route) => false);
            },
          )
        ],
      ),
    );
  }
}
