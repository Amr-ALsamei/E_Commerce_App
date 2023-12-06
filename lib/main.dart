import 'package:e_commerceapp/Binding/initialBinding.dart';
import 'package:e_commerceapp/core/Localization/changelocal.dart';
import 'package:e_commerceapp/core/Localization/transilation.dart';
import 'package:e_commerceapp/core/services/services.dart';
import 'package:e_commerceapp/routes.dart';

// import 'package:e_commerceapp/view/screen/language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await InitialServices();
  // print("Hello");

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // InitialServices();
    LocalController controller=Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: controller.appThem,
      // home: Languages(),
      // routes: routes,
      getPages: routesPages,
      initialBinding: InitialBindings(),
    );
  }
}

