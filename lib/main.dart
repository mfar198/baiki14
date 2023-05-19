import 'package:baiki/ui/searchShop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:baiki/navigations/routes.dart';
import 'package:baiki/header/appBar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:baiki/login/login_page.dart';
import 'package:provider/provider.dart';
import 'package:baiki/ui/theme/themeData.dart';
import 'package:shared_preferences/shared_preferences.'
    'dart';
import 'package:baiki/login/user_preference.dart';

void main() async{

  //Code for API check login


  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs){
    var isDarkTheme = prefs.getBool("darkTheme") ?? false;
    return runApp(
      ChangeNotifierProvider<ThemeProvider>(
        child: MyApp(),
        create: (BuildContext context) {
          return ThemeProvider(isDarkTheme);
        },
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child){
      return MaterialApp.router(
        title: 'Baiki',
        theme: value.getTheme(useMaterial3 : true),
        routerConfig: NavigationRoutes.router,
        debugShowCheckedModeBanner: false,
      );
  },
  );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(),
      endDrawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //myHeaderDrawer(),
              loginPage(),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(child:
          Container(
            color: Color.fromRGBO(251, 31, 38, 1),
            child: Stack(
              children: [
                Positioned(
                    left: -15,
                    top: 10,
                    child:
                    Image.asset('assets/images/Laptop.png', width: 290, height: 290,)
                ),
                Positioned(
                    top: -75,
                    right: 20,
                    child:
                    Image.asset('assets/images/Nearest_Repair.png', width: 320, height: 320,)
                ),
                Positioned(
                  bottom: 115,
                  right: 40,
                  child: ElevatedButton(
                    onPressed: () => context.push('/baiki/search'),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(255, 255, 255, 1),
                      shadowColor: Colors.grey,
                      elevation: 5,
                      minimumSize: Size(150, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      "Go",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ),
          Expanded(child:
          Container(
            color: Colors.white,
            child: Stack(
              children: [
                Positioned(
                    left: 45,
                    top: -20,
                    child:
                    Image.asset('assets/images/ALR.png', width: 320, height: 320,)
                ),
                Positioned(
                    top: -80,
                    right: -100,
                    child:
                    Image.asset('assets/images/Hand.png', width: 350, height: 350,)
                ),
                Positioned(
                  bottom: 90,
                  left: 50,
                  child: ElevatedButton(
                    onPressed: () => context.push('/baiki/search'),
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(251, 31, 38, 1),
                    shadowColor: Colors.grey,
                    elevation: 1,
                    minimumSize: Size(150, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    "Go",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ),
              ],
            ),
          ),
          ),
        ],
      ),
    );
  }
}


