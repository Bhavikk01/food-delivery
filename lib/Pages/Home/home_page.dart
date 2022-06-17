import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Pages/Cart/cart_history.dart';
import 'package:food_delivery/Pages/Home/main_food_page.dart';
import 'package:food_delivery/Pages/account/account_page.dart';
import 'package:food_delivery/Pages/auth/sign_up_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late PersistentTabController _controller;

  int _selectedIndex = 0;
  List <Widget> _buildScreen() {
    return [
      const MainFoodPage(),
      const SignUpPage(),
      const CartHistory(),
      const AccountPage()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.home_outlined),
            title: "Home"
        ),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.archive),
            title: "History"
        ),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.shopping_cart),
            title: "Cart"
        ),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.person),
            title: "Me"
        )
    ];
  }

    @override
    void initState(){
      super.initState();
      _controller = PersistentTabController(initialIndex: 0);
    }

    void onTapNav(int index){
      setState((){
        _selectedIndex = index;
      });
    }

    @override
    Widget build(BuildContext context){
      return PersistentTabView(
        context,
        screens: _buildScreen(),
        items: _navBarItems(),
        controller: _controller,
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        navBarStyle: NavBarStyle.style9,
      );
    }
  }
