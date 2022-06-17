import 'package:flutter/material.dart';
import 'package:food_delivery/Utils/bigText.dart';
import 'package:food_delivery/Utils/color_utils.dart';
import 'package:food_delivery/Utils/dimentions.dart';
import 'package:food_delivery/Utils/icon_style.dart';
import 'package:food_delivery/widgets/account_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profile",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(
          top: Dimensions.height20,
        ),
        child: Column(
          children: [
            AppIcon(
                icon: Icons.person,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: 75,
                size: 150,
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: 25,
                        size: 50,
                      ),
                      bigText: BigText(
                        text:'Bhavik',
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    AccountWidget(
                      appIcon: const AppIcon(
                        icon: Icons.phone,
                        backgroundColor: Colors.yellow,
                        iconColor: Colors.white,
                        iconSize: 25,
                        size: 50,
                      ),
                      bigText: BigText(
                        text:'9588876587',
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    AccountWidget(
                      appIcon: const AppIcon(
                        icon: Icons.email,
                        backgroundColor: Colors.yellow,
                        iconColor: Colors.white,
                        iconSize: 25,
                        size: 50,
                      ),
                      bigText: BigText(
                        text:'kotharibhavik23@gmail.com',
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    AccountWidget(
                      appIcon: const AppIcon(
                        icon: Icons.location_on,
                        backgroundColor: Colors.yellow,
                        iconColor: Colors.white,
                        iconSize: 25,
                        size: 50,
                      ),
                      bigText: BigText(
                        text:'Fill in your address',
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    AccountWidget(
                      appIcon: const AppIcon(
                        icon: Icons.message_outlined,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        iconSize: 25,
                        size: 50,
                      ),
                      bigText: BigText(
                        text:'Bhavik',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
