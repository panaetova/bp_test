import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountEmail:
              Text('email@gmail.com', style: TextStyle(color: Colors.white)),
          accountName: Text('Login',
              style: TextStyle(fontSize: 20.0, color: Colors.white)),
          currentAccountPicture: CircleAvatar(
            child: Image.network(
                'https://medialeaks.ru/wp-content/uploads/2019/08/2-33.jpg'),
          ),
          decoration: BoxDecoration(
            color: Color(0xFF55a3d6),
          ),
        ),
        ListTile(
          title: Text('Inbox'),
          leading: Icon(Icons.inbox),
        ),
        ListTile(
          title: Text('Today'),
          leading: Icon(Icons.calendar_today),
          // onTap: () {
          //   Navigator.push(
          //       context, MaterialPageRoute(builder: (context) => TasksList()));
          // },
        ),
        ListTile(
          title: Text('Soon'),
          leading: Icon(Icons.calendar_view_day),
        ),
      ],
    ));
  }
}
