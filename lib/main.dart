import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gpsapp/app/controllers/auth_controller.dart';
import 'package:gpsapp/app/modules/splash/views/splash_view.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'gpsapp',
    options: FirebaseOptions(
      projectId: "gpsapp-ac0a5",
      appId: '1:882063922110:android:523d81616de680756e1fef',
      apiKey: "AIzaSyBUyLJY_6DZ-2otFf6xXbUySL71bi_0IWo",
      messagingSenderId: '882063922110',
      storageBucket: "gpsapp-ac0a5.appspot.com",
    ),
  );

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final authC =
      Get.put(AuthController(), permanent: true); // controller permanent
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: authC.streamAuthStats,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "GpsApp",
              initialRoute: snapshot.data != null ? Routes.HOME : Routes.LOGIN,
              getPages: AppPages.routes,
            );
          }
          return MaterialApp(
              debugShowCheckedModeBanner: false, home: SplashView());
        });
  }
}
