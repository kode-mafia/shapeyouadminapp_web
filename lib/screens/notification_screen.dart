import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:shapeyouadmin_web/services/sidebar.dart';


class NotificationScreen extends StatelessWidget {
  static const String id = 'notification-screen';
  @override
  Widget build(BuildContext context) {

    SideBarWidget _sideBar =SideBarWidget();


    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        title: const Text('Grocery App Dashboard',style: TextStyle(color: Colors.white),),
      ),
      sideBar: _sideBar.sideBarMenus(context,NotificationScreen.id),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: Text(
            'Notification Manage Screen',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
          ),
        ),
      ),
    );
  }
}
