import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:shapeyouadmin_web/screens/admin_users.dart';
import 'package:shapeyouadmin_web/screens/category_screen.dart';
import 'package:shapeyouadmin_web/screens/delivery_boy_screen.dart';
import 'package:shapeyouadmin_web/screens/home_screen.dart';
import 'package:shapeyouadmin_web/screens/login_screen.dart';
import 'package:shapeyouadmin_web/screens/manage_banners.dart';
import 'package:shapeyouadmin_web/screens/notification_screen.dart';
import 'package:shapeyouadmin_web/screens/order_screen.dart';
import 'package:shapeyouadmin_web/screens/setting_screen.dart';
import 'package:shapeyouadmin_web/screens/vendor_screen.dart';

class SideBarWidget{


  sideBarMenus(context,selectedRoute){
    return SideBar(
      activeBackgroundColor: Colors.black54,
      activeIconColor: Colors.white,
      activeTextStyle: TextStyle(color: Colors.white),
      items: const [
        MenuItem(
          title: 'Dashboard',
          route: HomeScreen.id,
          icon: Icons.dashboard,
        ),
        MenuItem(
          title: 'Banners',
          route: BannerScreen.id,
          icon: CupertinoIcons.photo,
        ),
        MenuItem(
          title: 'Vendor',
          route: VendorScreen.id,
          icon: CupertinoIcons.group_solid,
        ),
        MenuItem(
          title: 'Delivery Boy',
          route: DeliveryBoyScreen.id,
          icon: Icons.delivery_dining,
        ),
        MenuItem(
          title: 'Categories',
          route: CategoryScreen.id,
          icon: Icons.category,
        ),
        MenuItem(
          title: 'Orders',
          route: OrderScreen.id,
          icon: CupertinoIcons.cart_fill,
        ),
        MenuItem(
          title: 'Send Notification',
          route: NotificationScreen.id,
          icon: Icons.notifications,

        ),
        MenuItem(
          title: 'Admin Users',
          route: AdminUsers.id,
          icon: Icons.person_rounded,
        ),
        MenuItem(
          title: 'Settings',
          route: SettingScreen.id,
          icon: Icons.settings,
        ),
        MenuItem(
          title: 'Exit',
          route: LoginScreen.id,
          icon: Icons.exit_to_app,
        ),

      ],
      selectedRoute: selectedRoute,
      onSelected: (item) {
        Navigator.of(context).pushNamed(item.route);
      },
      header: Container(
        height: 50,
        width: double.infinity,
        color: Colors.black26,
        child: Center(
          child: Text(
            'MENU',
            style: TextStyle(letterSpacing: 2,
                color: Colors.white,fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      footer: Container(
        height: 50,
        width: double.infinity,
        color: Colors.black26,
        child: Center(
          child: Image.asset('images/logo.png',height: 30,),
        ),
      ),
    );
  }
}


