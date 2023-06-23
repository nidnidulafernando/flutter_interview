import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intern/Components/component.dart';

import '../https/api_service.dart';
import '../https/user_model.dart';

class productDetail extends StatefulWidget {
  const productDetail({super.key});

  @override
  State<productDetail> createState() => _productDetailState();
}

class _productDetailState extends State<productDetail> {
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

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: blu,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 19,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 32,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    badges.Badge(
                      position: BadgePosition.topEnd(end: -1, top: -6),
                      badgeContent: Text(" "),
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        size: 32,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 50,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assest/round.png',
                  width: 280,
                  height: 280,
                ),
              ),
            ),
            Positioned(
              top: 80,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  items: [
                    for (int i = 0; i < 3; i++)
                      Padding(
                        padding: EdgeInsets.only(left: 38, right: 38),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: _userModel == null || _userModel!.isEmpty
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : prod(_userModel![0].images),
                        ),
                      ),
                  ],
                  options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          print(reason.toString());
                          currentIndex = index;
                        });
                      },
                      autoPlay: false),
                ),
              ),
            ),
            Positioned(
                top: 350,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 3; i++)
                        Padding(
                          padding: EdgeInsets.only(left: 2, right: 2),
                          child: Container(
                            height: 11,
                            width: 11,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: currentIndex == i
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                )),
            Positioned(
              top: 390,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      height: 5,
                      width: 98,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey.withOpacity(0.4)),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Container(
                      height: 70,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: _userModel == null ||
                                              _userModel!.isEmpty
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : txt(
                                              _userModel![0].title,
                                              Colors.black,
                                              25,
                                              FontWeight.bold)),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        RatingBar.builder(
                                          itemSize: 22,
                                          initialRating: _userModel![0].rating,
                                          minRating: 0,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star_border_rounded,
                                            color: Colors.deepOrange,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                        FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Text(
                                              _userModel![0].rating.toString(),
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black54),
                                            )),
                                        FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: txt(
                                                "(28 reviews)",
                                                Colors.grey,
                                                17,
                                                FontWeight.w500))
                                      ],
                                    ),
                                  )
                                ],
                              )),
                          Expanded(
                              flex: 1,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: txt(_userModel![0].price,
                                            Colors.black, 34, FontWeight.w500))
                                  ]))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 100,
                      child: txt3(_userModel![0].description, Colors.grey, 20,
                          FontWeight.normal),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          itemFeature(
                            Icon(
                              Icons.remove_red_eye,
                              size: 17,
                            ),
                            "Improved Optics",
                          ),
                          itemFeature(
                            Icon(
                              Icons.sunny,
                              size: 17,
                            ),
                            "Clear Brightness",
                          ),
                          itemFeature(
                            Icon(
                              Icons.wifi,
                              size: 17,
                            ),
                            "Wifi Controllers",
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: txt(
                              "Checkout", Colors.white, 23, FontWeight.w600)),
                    )
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
