import 'package:app/utils/status.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {

  final pages page;

  CustomDrawer({this.page});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 12,
      child: ListView(
        children: <Widget>[
          Container(
              color: page == pages.administrativo ? Colors.grey[200] : null,
              child: ListTile(
                trailing: new Icon(Icons.assignment),
                title: new Text("Adiministrativo",style: TextStyle(fontSize: page == pages.agencia ? 14 : 12),),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/Init');
                },
              )),
          Container(
              color: page == pages.agencia ? Colors.grey[200] : null,
              child: ListTile(
                trailing: new Icon(Icons.assignment),
                title: new Text("Agencia",style: TextStyle(fontSize: page == pages.agencia ? 14 : 12),),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/Init');
                },
              )),
          Container(
              color: page == pages.comercial ? Colors.grey[200] : null,
              child: ListTile(
                trailing: new Icon(Icons.assignment),
                title: new Text("comercial",style: TextStyle(fontSize: page == pages.agencia ? 14 : 12),),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/Comercial');
                },
              )),
          Container(
              color: page == pages.financiero ? Colors.grey[200] : null,
              child: ListTile(
                trailing: new Icon(Icons.assignment),
                title: new Text("financiero",style: TextStyle(fontSize: page == pages.agencia ? 14 : 12),),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/Init');
                },
              )),
          Container(
              color: page == pages.proyecto ? Colors.grey[200] : null,
              child: ListTile(
                trailing: new Icon(Icons.assignment),
                title: new Text("proyectos",style: TextStyle(fontSize: page == pages.agencia ? 14 : 12),),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/Init');
                },
              )),
          Container(
              color: page == pages.usuario ? Colors.grey[200] : null,
              child: ListTile(
                trailing: new Icon(Icons.assignment),
                title: new Text("Usuarios",style: TextStyle(fontSize: page == pages.agencia ? 14 : 12),),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/Init');
                },
              )),
          Divider(
            height: 30.0,
          ),
          Container(
              child: ListTile(
                trailing: new Icon(Icons.exit_to_app),
                title: new Text("Salir",style: TextStyle(fontSize: 12),),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/Init');
                },
              )),
        ],
      ),
    );
  }
}
