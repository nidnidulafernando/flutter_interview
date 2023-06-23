import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:intern/Components/component.dart';
import 'package:http/http.dart' as http;
import 'package:intern/Pages/productDetail.dart';
import 'dart:convert';

import '../https/api_service.dart';
import '../https/user_model.dart';

class homePg extends StatefulWidget {
  const homePg({super.key});

  @override
  State<homePg> createState() => _homePgState();
}
// String stringResponse="";
// Map? mapResponse;
// List? listResponse;

class _homePgState extends State<homePg> {
  late List<UserModel>? _userModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Padding(
            padding: EdgeInsets.only(left: 20),
            child: SvgPicture.asset("assest/drawer.svg")),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: SizedBox(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      child: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 35,
                  )),
                  badges.Badge(
                    position: BadgePosition.topEnd(end: -1, top: -6),
                    badgeContent: Text(" "),
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 32,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedItemColor: blu,
        unselectedItemColor: Colors.grey.withOpacity(0.4),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Home',
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: txt("Enjoy the world \ninto virtual reality", Colors.black,
                25, FontWeight.w600),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 220,
            child: Stack(
              children: [
                Positioned(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: blu, borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 0.5),
                      child: Container(
                        alignment: Alignment.center,
                        width: 190,
                        child: Image(image: AssetImage('assest/ar.png')),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 140,
                  left: 40,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      color: Colors.white,
                    ),
                    child: txt("Buy Now!", blu, 15, FontWeight.w600),
                  ),
                ),
                Positioned(
                  left: 40,
                  top: 30,
                  child: Container(
                      child: txt(
                          "Improved Controller\nDesign With\nVirtual Reality",
                          Colors.white,
                          20,
                          FontWeight.w700)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                types("All Product", Colors.white, blu),
                types("Popular", Colors.black, Colors.grey.withOpacity(0.4)),
                types("Recent", Colors.black, Colors.grey.withOpacity(0.4)),
                types("Reconditioned", Colors.black,
                    Colors.grey.withOpacity(0.4)),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: _userModel == null || _userModel!.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      width: 10,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: _userModel!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => productDetail()),
                            );
                          },
                          child: apiList(
                              _userModel![index].title,
                              _userModel![index].images,
                              _userModel![index].price));
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
