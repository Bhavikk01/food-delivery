import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/Pages/auth/sign_up_page.dart';
import 'package:food_delivery/Utils/bigText.dart';
import 'package:food_delivery/Utils/color_utils.dart';
import 'package:food_delivery/Utils/dimentions.dart';
import 'package:food_delivery/widgets/app_text_fill.dart';
import 'package:get/get.dart';

import '../Home/home_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    final _auth = FirebaseAuth.instance;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const SizedBox(
                child: Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(
                      "lib/assets/images/chawal.jpg",
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  top: 20,
                ),
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: "Hello",
                      size: 60,
                      color: Colors.black,
                    ),
                    BigText(
                      text: "Sign into your account",
                      size: 20,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              AppTextField(
                textController: emailController,
                hintText: 'Enter your email',
                icon: Icons.email,
              ),
              const SizedBox(height: 20,),
              AppTextField(
                textController: passwordController,
                hintText: 'Enter your password',
                icon: Icons.password_sharp,
              ),
              const SizedBox(height: 20,),
              GestureDetector(

                onTap: (){
                  _auth.signInWithEmailAndPassword(
                      email: emailController.text, password: passwordController.text)
                      .then((value) => {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage())),
                  });
                },
                child: Container(
                  width: Dimensions.screenWidth/2,
                  height: Dimensions.screenHeight/13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.mainColor,
                  ),
                  child: Center(
                    child: BigText(
                      text: 'Sign in',
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50,),
              RichText(
                text: TextSpan(
                  text: "Don't have an account?",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=> const SignUpPage()),
                      text: " Create one",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),)
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
