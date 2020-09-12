import 'package:cartapp/src/ui/screen/cart/cart_page.dart';
import 'package:cartapp/src/ui/screen/home/home.dart';
import 'package:cartapp/src/ui/screen/user/user_account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeNavigation extends StatefulWidget {
  final int index;
  HomeNavigation({this.index});

  @override
  _HomeNavigationState createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int _selectedIndex = 0;
  final List<Widget> _children = [Explore(),Cart(),UserAccount()];
  void _onItemTapped(int index) {
//    if(index==1 || index==4||index==3)
//      showToast("Coming soon");
//    else
    setState(() {
      _selectedIndex = index;
    });
  }
@override
  void initState() {
    widget.index!=null?_selectedIndex=widget.index:_selectedIndex=0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex], // new
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            backgroundColor: Colors.white,showSelectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon:ImageIcon(
                  AssetImage("asset/icon/explore.png"),color: Color(0xFFFF7600),
                ),activeIcon: Text('Explore\n.',style: TextStyle(fontSize:16,fontWeight: FontWeight.w600,color: Colors.black),textAlign: TextAlign.center,),
                title: Text('Explore'),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("asset/icon/cart.png"),color: Color(0xFFFF7600),
                ),activeIcon: Text('Cart\n.',style: TextStyle(fontSize:18,fontWeight: FontWeight.w600,color: Colors.black),textAlign: TextAlign.center,),
                title: Text('Cart'),
              ),
              BottomNavigationBarItem(
                icon:  ImageIcon(
                  AssetImage("asset/icon/user_account.png"),color: Color(0xFFFF7600),
                ),
                title: Text('Account'),activeIcon: Text('Account\n.',style: TextStyle(fontSize:18,fontWeight: FontWeight.w600,color: Colors.black),textAlign: TextAlign.center,),
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.grey.shade700,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.grey.shade500,
            onTap: _onItemTapped,
          ),
        ),
    );
  }
}
