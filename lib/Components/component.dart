import 'dart:ffi';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color blu = Color(0xFF6084d4);

Image prod(String image) {
  return Image.network(image);
}

Container apiList(String title, String image, String price) {
  return Container(
    height: 150,
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.1),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: 2,
            child: Image.network(
              image,
              width: 130,
            )),
        Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: txt(title, Colors.black, 11, FontWeight.bold)
                      // Text(title)
                      ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: txt(
                              price, Colors.black54, 11, FontWeight.normal)),
                      SizedBox(
                        width: 125,
                      ),
                      Container(
                        height: 40,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(6)),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ))
      ],
    ),
  );
}

Container types(String string, Color col, Color background) {
  return Container(
    height: 40,
    margin: EdgeInsets.only(left: 20),
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
        color: background, borderRadius: BorderRadius.circular(6)),
    child: Center(child: txt(string, col, 18, FontWeight.w500)),
  );
}

Text txt(String string, Color col, double size, FontWeight fontWeight) {
  return Text(string,
      style: GoogleFonts.poppins(
          fontSize: size, fontWeight: fontWeight, color: col));
}

AutoSizeText txt3(
    String string, Color col, double size, FontWeight fontWeight) {
  return AutoSizeText(
    string,
    maxLines: 18,
    minFontSize: 10,
    textAlign: TextAlign.justify,
    style:
        GoogleFonts.poppins(fontSize: size, fontWeight: fontWeight, color: col),
    overflow: TextOverflow.ellipsis,
  );
}

Container itemFeature(Icon icon, String string) {
  return Container(
    height: 55,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child:
              Padding(padding: EdgeInsets.all(5), child: Center(child: icon)),
        ),
        SizedBox(
          height: 6,
        ),
        txt("Improveed Optics", Colors.black, 11, FontWeight.normal)
      ],
    ),
  );
}
