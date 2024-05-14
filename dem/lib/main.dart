import 'package:dem/scrrens/home.dart';
import 'package:dem/scrrens/mangencities.dart';
import 'package:dem/scrrens/splash.dart';
import 'package:dem/utilities/routes.dart';
import 'package:dem/utilities/sharedpreference.dart';
import 'package:dem/utilities/themeprovider.dart';
import 'package:dem/utilities/weatherservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async{
 WidgetsFlutterBinding.ensureInitialized();
  bool isDarkMode = await SharedPreferencesHelper.getmodeStatus();

  runApp(
  MultiProvider(providers: [
      ChangeNotifierProvider(
      create: (context) => Themeprovider(initialDarkMode: isDarkMode),),
      ChangeNotifierProvider(create:(context) => WeatherProvider(),)
  ],
   child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      theme: Provider.of<Themeprovider>(context).themeData,
      routes: {
        Routes.splash: (context) => const Splash(),
        Routes.home: (context) => const Home(),
        Routes.city: (context) => const ManageCity(), 
      },
    );
  }
}
