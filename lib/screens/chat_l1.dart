import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_trustmebro/utils/colors.dart';
import 'package:project_trustmebro/widgets/chat_card.dart';

class chatWin1 extends StatefulWidget {
  const chatWin1({super.key});

  @override
  _chatWin1State createState() => _chatWin1State();
}

class _chatWin1State extends State<chatWin1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        actions: [],
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
            chatCard(),
            chatCard(),
            chatCard(),
            chatCard(),
            chatCard(),
            chatCard(),
            chatCard(),
            chatCard(),
          ],
        ),
      ),
    );
  }
}
