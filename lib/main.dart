import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shapeyouadmin_web/screens/category_screen.dart';
import 'package:shapeyouadmin_web/screens/delivery_boy_screen.dart';
import 'package:shapeyouadmin_web/screens/home_screen.dart';
import 'package:shapeyouadmin_web/screens/order_screen.dart';
import 'package:shapeyouadmin_web/screens/splash_screen.dart';
import 'package:shapeyouadmin_web/screens/vendor_screen.dart';
import 'screens/admin_users.dart';
import 'screens/login_screen.dart';
import 'screens/manage_banners.dart';
import 'screens/notification_screen.dart';
import 'screens/setting_screen.dart';


void main() {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multi-Vendor App Admin Dash Board',
      theme: ThemeData(
        primaryColor: Color(0xffcb7405),
      ),
      initialRoute: SplashScreen.id,
      routes: {
        HomeScreen.id:(context)=>HomeScreen(),
        SplashScreen.id:(context)=>SplashScreen(),
        LoginScreen.id:(context)=>LoginScreen(),
        BannerScreen.id:(context)=>BannerScreen(),
        CategoryScreen.id:(context)=>CategoryScreen(),
        OrderScreen.id:(context)=>OrderScreen(),
        NotificationScreen.id:(context)=>NotificationScreen(),
        AdminUsers.id:(context)=>AdminUsers(),
        SettingScreen.id:(context)=>SettingScreen(),
        VendorScreen.id:(context)=>VendorScreen(),
        DeliveryBoyScreen.id:(context)=>DeliveryBoyScreen(),
      },
    );
  }
}





