import 'package:flutter/material.dart';
import 'package:project_trustmebro/utils/colors.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          color: primaryColor,
        ),
        height: MediaQuery.of(context).size.height * 0.36,
        padding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16,
            ).copyWith(right: 0), //edgesym

            child: Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                      "https://imgv3.fotor.com/images/blog-richtext-image/10-profile-picture-ideas-to-make-you-stand-out.jpg",
                ),
                 ), // circleavatar
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Vel Murugan",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          )
                        ]),
                  ),
                ),

                // Delete

                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          shrinkWrap: true,
                          children: [
                            'Delete',
                          ]
                              .map(
                                (e) => InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 16,
                                    ),
                                    child: Text(e),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          // Title Header
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            width: double.infinity,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                color: mobileBackgroundColor,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                // Title Txt
                child: Center(
                  child: Text(
                    "Calculator",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Description Header
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.19,
            width: double.infinity,
            child: const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                // Title Txt 50-60 word limit, change the
                child: Text(
                  "Calculator with many functions such as equation solving and integrations.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black87),
                ),
              ),
            ),
          ),
        ]));
  }
}
