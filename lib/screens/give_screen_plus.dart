// ignore_for_file: deprecated_member_use

import "dart:typed_data";

import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:project_trustmebro/models/post.dart";
import "package:project_trustmebro/providers/user_providers.dart";
import "package:project_trustmebro/resources/firestore_methods.dart";
import "package:project_trustmebro/utils/colors.dart";
import "package:project_trustmebro/utils/utils.dart";
import "package:project_trustmebro/models/user.dart";
import "package:provider/provider.dart";
import "package:uuid/uuid.dart";

class GiveScreen extends StatefulWidget {
  const GiveScreen({Key? key}) : super(key: key);

  @override
  _GiveScreenState createState() => _GiveScreenState();
}

class _GiveScreenState extends State<GiveScreen> {
  final TextEditingController _productController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  var _prodMaxLen = 20;
  var _descMaxLen = 400;
  Uint8List? _file;
  bool _isLoading = false;

  void postGive(
    String uid,
    String username,
    //String profImage,
  ) async {
    setState(() {
      _isLoading = true;
    });
    try {
      if (_file != null) {
        String res = await FirestoreMethods().uploadPost(
          _productController.text,
          _descController.text,
          uid,
          username,
          
        );          //_file!,
//profImage,

        if (res == "success") {
          setState(() {
            _isLoading = false;
          });
          showSnackBar("Posted!", context);
        } else {
          setState(() {
            _isLoading = false;
          });
          showSnackBar(res, context);
        }
      }
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _productController.dispose();
    _descController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          centerTitle: false,
          actions: [],
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(child: Container(), flex: 2),

                  // add smth to show add profiles
                  SvgPicture.asset(
                    'assets/lend_post.svg',
                    color: secondaryColor,
                    height: 200,
                  ),

                  const SizedBox(
                    height: 24,
                  ),

                  TextField(
                    controller: _productController,
                    maxLength: _prodMaxLen,
                    decoration: InputDecoration(
                      labelText:
                          'Enter Product Name (max $_prodMaxLen characters)',
                      counterText: '',
                    ),
                  ),

                  const SizedBox(height: 24),

                  TextField(
                    controller: _descController,
                    maxLength: _descMaxLen,
                    decoration: InputDecoration(
                      labelText:
                          'Enter description (max $_descMaxLen characters)',
                      counterText: '',
                    ),
                  ),

                  const SizedBox(height: 24),
                  InkWell(
                    onTap: () {
                        postGive(
                          userProvider.getUser.uid,
                          userProvider.getUser.username,
                        );
                      },
                    child: Container(
                      child: const Text('Submit'),
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        color: primaryColor,
                      ),
                    ),
                  ),

                  const SizedBox(height: 250),
                ]),
          ),
        ));
  }
}
