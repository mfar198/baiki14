import 'package:baiki/ui/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:baiki/navigations/routes.dart';
import 'package:baiki/controllers/login_controller.dart';
import 'package:get/get.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  late final TextEditingController textEditingController;
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
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
                      onPressed: () => context.go('/register'),
                      child: Text(
                        "Create Account",
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
              Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(padding: EdgeInsets.all(4)),
                    const Padding(padding: EdgeInsets.all(4)),

                    TextFormField(
                      controller: textEditingController,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => (value != null && value.isNotEmpty)
                            ? ''
                            : 'Email is empty',
                      style: GoogleFonts.poppins(),
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        filled: true,
                        contentPadding: EdgeInsets.only(
                          top: 0,
                          right: 16,
                          bottom: 0,
                          left: 16,
                      ),
                      border: UnderlineInputBorder(),
                      ),
                    ),
                  const Padding(padding: EdgeInsets.all(8)),
                  const Padding(padding: EdgeInsets.all(4)),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                    validator: (value) => (value != null && value.isNotEmpty)
                        ? ''
                        : 'Password is empty',
                    style: GoogleFonts.poppins(),
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: 'Password',
                      contentPadding: EdgeInsets.only(
                        top: 0,
                        right: 16,
                        bottom: 0,
                        left: 16,
                      ),
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(35)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(251, 31, 38, 1),
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            "Login",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(8)),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
