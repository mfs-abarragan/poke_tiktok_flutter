import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_tiktok_flutter/routes.dart';

import 'general/controllers/super_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(LifeCycleController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Poke Tiktok',
      initialRoute: 'splash',
      onGenerateRoute: getRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
