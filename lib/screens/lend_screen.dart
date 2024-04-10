// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_trustmebro/screens/chat_l1.dart';
import 'package:project_trustmebro/screens/get_screen_plus.dart';
import 'package:project_trustmebro/screens/give_screen_plus.dart';
import 'package:project_trustmebro/utils/colors.dart';
import 'package:project_trustmebro/widgets/post_card.dart';

class lendScreen extends StatelessWidget {
  const lendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text('Lend Window'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => chatWin1()),
              );
            },
            icon: const Padding(
              padding: EdgeInsets.only(right: 10, top: 20),
              child: Icon(
                Icons.messenger_outline,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GiveScreen()),
                );
              },
              icon: const Padding(
                padding: EdgeInsets.only(top: 20, right: 20),
                child: ImageIcon(
                  AssetImage('assets/add.png'),
                  color: Colors.white,
                  size: 20,
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 8, 7, 7).withOpacity(0.11),
                    blurRadius: 40,
                    spreadRadius: 0.0,
                  )
                ]),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 186, 184, 184),
                      contentPadding: EdgeInsets.all(15),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          'assets/search.svg',
                          height: 24,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none)),
                )),
            PostCard(),
            PostCard(),
            PostCard(),
          ],
        ),
      ),
    );
  }
}
