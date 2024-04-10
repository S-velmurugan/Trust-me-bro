import 'package:flutter/material.dart';
import 'package:project_trustmebro/resources/auth_methods.dart';
import 'package:project_trustmebro/screens/login_screen.dart';
import 'package:project_trustmebro/utils/colors.dart';
import 'package:project_trustmebro/widgets/follow_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text('username'),
        centerTitle: false,
         ), //appbar

         body: ListView(
            children: [
                Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
                children: [
                    Row(
                        children: [
                         CircleAvatar(
                             backgroundColor: Colors.grey,
                             backgroundImage: NetworkImage('https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?auto=compress&cs=tinysrgb&w=600',
                             ),
                             radius: 40,
                             ), // circleavatar
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                    buildStatColumn(20, "Friends"),
                                    buildStatColumn(20, "Lent"),
                                    buildStatColumn(20, "Borrowed"),
                              ],
                            ),

                            Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                            FollowButton(
                                text: 'Sign Out',
                                backgroundColor: Colors.red,
                                textColor: secondaryColor,
                                borderColor: Colors.black,
                                function: () async {
                                  await AuthMethods().signOut();
                                              if (context.mounted) {
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const LoginScreen(),
                                                  ),
                                                );
                                              }
                                },
                                ) // fb
                        ]

                    )


                          ],
                          
                        ), // col
                    ),

                     //row

                        ] // children
                    )//row
                ] // children
            ) // column  
            ) // padding
            ], //children
         ), // listview
    ); //scafoold
  } // build e over


Column buildStatColumn(int num, String label) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Text(
            num.toString(),
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
            ), // text style
            ), // text

            Container(
            margin: const EdgeInsets.only(top: 4),
              child: Text(
                 label,
                 style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                 ) // textstyle
              ),
            )
        ],
    );
}
}
