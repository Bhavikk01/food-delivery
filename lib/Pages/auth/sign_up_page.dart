import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Utils/bigText.dart';
import 'package:food_delivery/Utils/color_utils.dart';
import 'package:food_delivery/Utils/dimentions.dart';
import 'package:food_delivery/Utils/show_custom_message.dart';
import 'package:food_delivery/data/controllers/auth_controller.dart';
import 'package:food_delivery/models/auth_model.dart';
import 'package:food_delivery/widgets/app_text_fill.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();


    void _registration(){

      var authController = Get.find<AuthController>();
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if(name.isEmpty){
        showCustomSnackBar('Type in your name',title: 'name');
      }else if(phone.isEmpty){
        showCustomSnackBar('Type in your phone number', title: 'Phone Number');
      }else if(email.isEmpty){
        showCustomSnackBar('Type in your email', title: 'Email');
      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar('Type in a valid email address', title: 'Valid Email Adress');
      }else if(password.isEmpty){
        showCustomSnackBar('Type in your password', title: 'Password');
      }else if(password.length<6){
        showCustomSnackBar("Password can't be too short", title: 'Valid Password');
      }else{
        showCustomSnackBar('All went well', title: 'Sign Up Successful');
        AuthModel authModel = AuthModel(name: name, password: password, phone: phone, email: email);

        authController.registration(authModel);
      }
    }


    return Scaffold(
      body: SingleChildScrollView(
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
            const SizedBox(height: 50),
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
            AppTextField(
              textController: nameController,
              hintText: 'Enter your name',
              icon: Icons.person,
            ),
            const SizedBox(height: 20,),
            AppTextField(
              textController: phoneController,
              hintText: 'Enter your phone no.',
              icon: Icons.phone,
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                _registration();
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
                    text: 'Sign Up',
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10,),
            RichText(
                text: TextSpan(
                  text: "Have an account already?",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: "Sign up using one of the following method ",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                ),
                recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
              ),
            ),
            const SizedBox(height: 20,),
            
          ],
        ),
      ),
    );

  }
}
