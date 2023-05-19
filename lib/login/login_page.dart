import 'package:baiki/ui/register.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:baiki/navigations/routes.dart';
import 'package:baiki/controllers/login_controller.dart';
import 'package:get/get.dart';
import 'package:baiki/controllers/registration_controller.dart';
import 'package:baiki/login/widgets/input_fields.dart';
import 'package:baiki/login/widgets/submit_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:baiki/login/landing_page.dart';
import '../ui/theme/themeData.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


enum WidgetType {
  login,
  reg,
  profile,
}

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  //Code for switch widget
  WidgetType widgetType = WidgetType.login;

  void handleWidgetChange(WidgetType type) {
    setState(() {
      widgetType = type;
    });
  }
  //done

  RegisterationController registerationController =
  Get.put(RegisterationController());

  //LOGIN API CODE
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://192.168.0.156/baikihafis/public/api/login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      // Check if the response contains an access token
      if (jsonResponse.containsKey('access_token')) {
        // User is logged in, do something here (e.g. navigate to home page)
        final accessToken = jsonResponse['access_token'];
        print('Access Token: $accessToken');
      } else {
        // User is not logged in, navigate to login page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => landingPage()),
        );
      }
    } else {
      throw Exception('Failed to login');
    }
  }


  /**@override
  void initState() {
    super.initState();
    // Check if the user is already logged in
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token != null) {
      print('already login');
    }
  }**/

  //LOGIN API CODE

  LoginController loginController = Get.put(LoginController());

  var isLogin = true.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: SvgPicture.asset('assets/svg/login.svg'),
                ),
                const Padding(padding: EdgeInsets.all(16)),
                Container(
                  child: Text(
                    "Sign In ",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: FractionallySizedBox(
                    alignment: AlignmentDirectional.centerStart,
                    widthFactor: 0.25,
                    child: Container(
                      height: 3,
                      color: Colors.black,
                    ),
                  ),
                ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "If you are new",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          isLogin.value = false;
                        },
                        child: Text(
                          "Register",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Text(
                        " | ",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          isLogin.value = true;
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ]
                ),
                const Padding(padding: EdgeInsets.all(4)),
                isLogin.value ? loginWidget() : registerWidget(),

                Container(
                  height: 50,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: InkWell(
                      onTap: () {
                        Provider.of<ThemeProvider>(context, listen: false).swapTheme();
                      },
                      child: Row(
                        children: [
                          Icon(Icons.brightness_6_outlined,
                          size: 20,),
                          SizedBox(width: 10.0),
                          Text('Dark Mode'),
                        ],
                      ),
                    )
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 35,
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: InkWell(
                        onTap: () {
                          const url = 'https://amanz.my/';
                          launch(url);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.info_outline,
                              size: 20,),
                            SizedBox(width: 10.0),
                            Text('About'),
                          ],
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

  Widget registerWidget(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(padding: EdgeInsets.all(4)),
        const Padding(padding: EdgeInsets.all(4)),
        //----------------------name
        InputTextFieldWidget(registerationController.nameController, 'name'),
        const Padding(padding: EdgeInsets.all(8)),
        const Padding(padding: EdgeInsets.all(4)),
        //----------------------email
        InputTextFieldWidget(
            registerationController.emailController, 'email address'),
        const Padding(padding: EdgeInsets.all(8)),
        const Padding(padding: EdgeInsets.all(4)),
        //----------------------pass
        InputTextFieldWidget(
            registerationController.passwordController, 'password'),
        const Padding(padding: EdgeInsets.all(35)),
        //----------------------button
        SubmitButton(
          onPressed: () => registerationController.registerWithEmail(),
          title: 'Register',
        ),
        const Padding(padding: EdgeInsets.all(8)),
      ],
    );
  }

  Widget loginWidget(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(padding: EdgeInsets.all(4)),
        const Padding(padding: EdgeInsets.all(4)),
        //----------------------email
        /**InputTextFieldWidget(
            registerationController.emailController, 'email address'),
        const Padding(padding: EdgeInsets.all(8)),
        const Padding(padding: EdgeInsets.all(4)),
        //----------------------pass
        InputTextFieldWidget(
            registerationController.passwordController, 'password'),
        const Padding(padding: EdgeInsets.all(35)),**/
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: 'Email',
          ),
        ),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
          ),
        ),
        //----------------------button
        /**SubmitButton(
          onPressed: () => loginController.loginWithEmail(),
          title: 'Login',
        ),**/
        ElevatedButton(
          onPressed: () async {
            try {
              await login(
                emailController.text,
                passwordController.text,
              );
              print('success');
              landingPage();
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to login')),
              );
            }
          },
          child: Text('Login'),
        ),
        const Padding(padding: EdgeInsets.all(8)),
      ],
    );
  }
}
