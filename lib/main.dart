import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/routes/app_pages.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      title: "Granter Challenger",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
 
   
  
}
